# Friendr

[Live Site](https://friendr.io/)

Friendr is a site for finding and making friends that was inspired by OKCupid. It utilizes technologies including Rails, PostgreSQL, React, Redux, Google Maps, and Cloudinary to create a seamless user experience. The project was built from scratch over a 10 day period from 1/30/2018 to 2/9/2018.

## Features

* Backend to frontend secure user authentication with passwords encrypted by BCrypt
* Profiles give users intuitive tools making it easy for them to express their personalities
* Users can answer match questions to improve the compatibility of friends suggested to them
* Search gives users many options to choose what is important to them
* Messaging features make it easy to meet new people and plan activities with new friends

### Profile Creation

Profile creation includes several distinct features.

* Setting basic fields (name, birth date, gender)
* Writing open ended answers (About Me, What I'm Looking For)
* Setting the user's location
* Uploading a profile image

![Profile Creation](https://i.imgur.com/h3SqU4z.gif)

#### User Location

A user's location is stored in the database as a pair of latitude and longitude coordinates. In order to make setting this location a simple process for users, Friendr takes advantage of the Google Maps API. When users click to edit the header of their profile they will be shown a map centered on the location they currently have set in the database with a marker at that location (if no location has been set, the map is defaulted to show San Francisco). Users can scroll and zoom on the map to find their location. An event listener has been set to respond when a user clicks on the map by setting a marker to that location and updating the React Component's state:

```js
  listenForClick(marker) {
      google.maps.event.addListener(this.map, 'click', (e) => {
        marker.setMap(null);
        marker = new google.maps.Marker({
            position: e.latLng,
            map: this.map
        });
        this.setState({
          latitude: e.latLng.lat(),
          longitude: e.latLng.lng()
        });
      });
    }
```

#### Profile Image

Profile images are uploaded directly to Cloudinary, allowing only a url of the image to be stored in the database and transferred whenever a page is loaded. In order to keep Cloudinary's API keys secret, Friendr utilizes the Figaro gem allowing the API keys to be sent to Heroku without being pushed to Github.

### Questions

At the heart of Friendr's compatibility algorithm are the site's questions. Answering questions allows users to tell Friendr what qualities are important to them in a friendship.

![Questions](https://i.imgur.com/tjiXXjO.gif)

Storing a question and the corresponding answers requires several tables and relationships in the database. A question can have several options that users can select as answers. Many users will answer each question, so `questions` will have many `question_answers`. When a user does answer a question, they do not just select an importance and an option from  `question_options` as their answer, but also potentially many `question_friend_answers` (answers they will accept from a friend).

These models for these tables possess validations on the presence of one another to prevent question answers from getting into the database without a corresponding question, and to ensure that if a question answer ever needs to be destroyed, the corresponding question friend answers are also destroyed from the database.

```ruby
class QuestionAnswer < ApplicationRecord
  validates :importance, :question_option_id, presence: true
  validate :not_all_options, :appropriate_importance

  belongs_to :question
  belongs_to :user
  belongs_to :question_option, optional: true
  has_many :question_friend_answers, dependent: :destroy

  def not_all_options
    if question_friend_answers.length == question.question_options.length
      errors.add(:question_friend_answers, "should be 'Any of the above' if you will accept any answer")
    end
  end

  def appropriate_importance
    if question_friend_answers.first &&
       question_friend_answers.first.question_option_id != -1 &&
       importance == 0
      errors.add(:importance, "must be selected")
    end
  end
end
```

### Friend Search

The Friendr search feature allows users to find friends limited within an age range they specify, within a certain distance from their location, and who have been active within a certain amount of time. It also allows users to sort their results based upon their compatibility % with other users or based upon the distance between their location and the other user's location. The search parameters for each user are stored on the server, so once a user sets the parameters that they want to search by, the site will continue to use those parameters every time they return to Friendr until they choose to update them.

![Search](https://i.imgur.com/zQEQE2F.gif)

Powering the search feature is complex logic on the backend to produce the search results. The search requires information that is stored on a user's profile (birthdate, latitude, longitude, name), all of the user's `question_answers`, and their corresponding `question_friend_answers` (the answers that they will accept from a friend).

In order to avoid an N+1 query, the search feature utilizes ActiveRecord's `includes` method to grab all of this information in a single database query:

```ruby
@search_result = @search_result
                .includes(:profile)
                .includes(question_answers: :question_friend_answers)
                .where("users.id != #{current_user.id}")
                .where("users.demo IS NULL")
```

In order to calculate distances between two users Friendr uses the Haversine formula to determine the distance along the surface of a sphere between two points specified by latitude and longitude.

```ruby
def distance(loc1, loc2)
  return nil if loc1[0].nil? || loc1[1].nil? || loc2[0].nil? || loc2[1].nil?
  radians_per_degree = Math::PI / 180
  earth_radius_miles = 3959

  latitude_difference = (loc2[0] - loc1[0]) * radians_per_degree
  longitude_difference = (loc2[1] - loc1[1]) * radians_per_degree

  lat1_rad, lon1_rad = loc1.map { |i| i * radians_per_degree }
  lat2_rad, lon2_rad = loc2.map { |i| i * radians_per_degree }

  a = Math.sin(latitude_difference / 2)**2 + Math.cos(lat1_rad) *
      Math.cos(lat2_rad) * Math.sin(longitude_difference/2)**2
  c = 2 * Math::atan2(Math::sqrt(a), Math::sqrt(1 - a))

  (earth_radius_miles * c).round
end
```

Finally, the crux of the searching algorithm is the compatibility calculation. In order to compute the compatibility between the current user and another user, Friendr does several things:

1. Find all of the questions that both the current user and the other user have answered.
2. Sum the importance that the current user has attached to each of these questions (Importance values, High: 7, Medium: 3, Low: 1, Allow Any Answer: 0)
3. For the questions where the other user's answer is included in the friend answer options that the current user will accept sum the importance the user has attached to these.
4. Divide the sum from item #3 by the sum from item #2 to get the compatibility that the current user would rate the other user.
5. Since friendship is not one-sided, steps 2-4 are repeated swapping the positions of the current user and the other user. The results of both calculations are averaged together.
6. Since Friendr does not want to give high match percentages based on very few questions, the inverse of the number of mutual questions is subtracted from the average calculated in item #5.
7. Results are rounded to 3 significant digits, and negative values are rounded up to zero.

### Messaging

When a user views their messages on Friendr they see them separated into conversations with every other user they have interacted with. These conversations are ordered based upon the time that the most recent message in each conversation was sent/received with the conversations that have had the most recent activity appearing at the top.

![Messaging](https://i.imgur.com/400OXej.gif)

By default a conversation shows a snippet of the first 160 characters of the most recent message that has been sent or received with another user; however, upon clicking on the conversation it is expanded to display a full history of the messages that have been exchanged with another user including the dates when each message was sent.

## Future Features

* Landing page to show when users log in showing an assortment of friends based on their search criteria (instead of taking users directly to their profile page)

* Using web sockets with messaging feature so that chats will automatically update when new messages are received

* Adding additional features to search (search by gender, search for keywords on a user's profile)

* Doing the compatibility calculation as part of the friend search SQL query, eliminating the need to create Ruby objects for each of the `question_answers` and `question_friend_answers` thereby improving search efficiency

* Links from messages page to the profiles of the people that a user has been messaging
