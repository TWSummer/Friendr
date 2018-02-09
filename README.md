# Friendr

[Live Demo](https://make-friends.herokuapp.com/)

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

### Messaging

![Messaging](https://i.imgur.com/400OXej.gif)

More details
