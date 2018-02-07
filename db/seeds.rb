# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

profile_photos = [
  "http://res.cloudinary.com/twsummer/image/upload/v1517963164/yzrjtsokine6ofua6iia.jpg",
  "http://res.cloudinary.com/twsummer/image/upload/v1517963382/v4n3bcczlvvfdwbhbz1j.jpg",
  "http://res.cloudinary.com/twsummer/image/upload/v1517963608/krohxvr89ivlls67qt7l.jpg",
  "http://res.cloudinary.com/twsummer/image/upload/v1517963997/qdnrshobw5o1s24wywep.jpg",
  "http://res.cloudinary.com/twsummer/image/upload/v1517964985/dkcw9kmengkkd55kft8k.jpg",
  "http://res.cloudinary.com/twsummer/image/upload/v1517965084/sirjvi4dl0grui4tpsls.jpg",
  "http://res.cloudinary.com/twsummer/image/upload/v1517965329/dabovuw1frikun9jnmcw.jpg",
  "http://res.cloudinary.com/twsummer/image/upload/v1517965587/crxftqfxg2yf00egv3d6.jpg",
  "http://res.cloudinary.com/twsummer/image/upload/v1517965929/fzhhldyxmsm3aqvgv1z1.jpg",
  "http://res.cloudinary.com/twsummer/image/upload/v1517966313/kqz5ugbzhb9ytsteqyyr.jpg",
  "http://res.cloudinary.com/twsummer/image/upload/v1517966378/wf4kb1m55h1rcaxapoge.jpg",
  "http://res.cloudinary.com/twsummer/image/upload/v1517966420/dduj7pfbfrcqeorccuf9.jpg",
  "http://res.cloudinary.com/twsummer/image/upload/v1517966447/csnxn3nwg0rayaoxw90y.jpg",
  "http://res.cloudinary.com/twsummer/image/upload/v1517966721/gss63yifcwmidtgtwdyp.jpg",
  "http://res.cloudinary.com/twsummer/image/upload/v1517966816/hsplcltvgnh6typi5kkb.jpg",
  "http://res.cloudinary.com/twsummer/image/upload/v1517966842/spsfmywfgqrs1i2ujpfr.jpg",
  "http://res.cloudinary.com/twsummer/image/upload/v1517966864/cjqeqfv9iis2wfnciw8r.jpg",
  "http://res.cloudinary.com/twsummer/image/upload/v1517966911/k6msnfvla9h6l0ccbujp.jpg",
  "http://res.cloudinary.com/twsummer/image/upload/v1517966957/klqvmln1wps0qzsolhg4.jpg",
  "http://res.cloudinary.com/twsummer/image/upload/v1517967017/w2jzqwzcvaotgtenawsu.jpg",
  "http://res.cloudinary.com/twsummer/image/upload/v1517967063/jprjdrpjrxol4uwccata.jpg",
  "http://res.cloudinary.com/twsummer/image/upload/v1517967133/bk8ow3b1qlb0twvxgecu.jpg",
  "http://res.cloudinary.com/twsummer/image/upload/v1517967233/gwds6aywil1sxxbtpxeq.jpg",
  "http://res.cloudinary.com/twsummer/image/upload/v1517967308/qikxe2bucivocattzvcu.jpg",
  "http://res.cloudinary.com/twsummer/image/upload/v1517967376/i1unb82vix5e8zdacu0c.jpg"
]

about = [
  "I love cats. I love every kind of cat, and I just want to hug all of them, but I can't. I can't hug every cat! :\'-(",
  "I am an avid candle enthusiast. Show me any candle and I can tell you its name, manufacturer, wax composition, melting point, and 3 ways that it could be made better. My bedroom, or 'den of candles' as I like to call it, is a place of solitude and sanctuary where I practice my craft.",
  "5 things about me:

  1. I sleep in my jeans.

  2. I can name every pokemon.

  3. Watermelon > Cantaloupe

  4. I spend at least 12 hours per day in my basement.

  5. I am quality friend material",
  "What can I say other than I am a great friend who totally will not come to your house and watch you while you are sleeping. What more could you ask for?",
  "I am a consultant by day and an urban adventurer by night. I am an ambitious young urbanite that enjoys writing my life story as if I am the protagonist of a novel, observing the world from as many angles as possible, and helping other people achieve their dreams.",
  "I am a collector of non-Newtonian fluids. I currently have 47 examples of fluids in my home with viscosities that are dependent on shear rate. I hope to increase this to 60 in the next 12 months.",
  ""
]

looking = [
  "10-15 test subjects who will perform humiliating acts on live TV for menial amounts of money. What do you say, friend?",
  "True friendship multiplies the good in life and divides its evils. Strive to have friends, for life without friends is like life on a desert island… to find one real friend in a lifetime is good fortune; to keep them is a blessing.",
  "True friendship comes when the silence between two people is comfortable.",
  "A friend is one that knows you as you are, understands where you have been, accepts what you have become, and still, gently allows you to grow.",
  "Wishing to be friends is quick work, but friendship is a slow ripening fruit.",
  "Do I not destroy my enemies when I make them my friends?",
  "We cannot tell the precise moment when friendship is formed. As in filling a vessel drop by drop, there is at last a drop which makes it run over; so in a series of kindnesses there is at last one which makes the heart run over.",
  "\"No person is your friend who demands your silence, or denies your right to grow.\" -Alice Walker

  I want to find a friend who I can grow together with!",
  "You can make more friends in two months by becoming interested in other people than you can in two years by trying to get other people interested in you.",
  "I want to meet people who will come hiking with me and will gawk at the awesome variety of fungi that we come across, and will help me identify them.

  I use the iNaturalist App currently, which is a lot of fun, but it would be great to meet friends who are also good at identifying fungi!",
  "I have a goal to wear pants belonging to 40 different people in 40 days. Please send me a message if you have a pair of pants that you would be willing to let me try.

  Bonus points if they are funny pants!",
  "Message me if you are any of the following:

  1. Good at high fives

  2. A collector of stamps

  3. Able to square dance

  4. Willing to teach me how to use chopsticks

  5. Interested in playing Overwatch with me

  6. A rugby fan",
  "A close friend who will come with me on a trip to Belize, the Galapagos, Iceland, or Madagascar!",
]

50.times do
  user = User.new(
    username: SecureRandom.urlsafe_base64,
    password: "password"
  )
  user.profile = Profile.create(
    name: Faker::Name.first_name,
    birthdate: Date.today - (rand(62) + 18).years + rand(365).days,
    latitude: rand(23.2) + 25.8,
    longitude: rand(58.3) - 125.0,
    gender: ["Male", "Female", "Other", "Prefer Not to Say"].shuffle.first,
    about_me: about.shuffle.first,
    looking_for: looking.shuffle.first,
    primary_img_url: profile_photos.shuffle.first
    )
  user.search_query = SearchQuery.new(
    min_age: 18,
    max_age: 99,
    active_within: 21
  )
  user.save
  Question.all.each do |question|
    question_answer = QuestionAnswer.create(
      question: question,
      user: user,
      question_option: question.question_options.shuffle.first,
      importance: [1, 3, 7].shuffle.first
    )
    options = question.question_options.shuffle
    friend_answers = options.take(rand(question.question_options.length - 2) + 1)
    friend_answers.each do |friend_answer|
      QuestionFriendAnswer.create(
        question_answer: question_answer,
        question_option: friend_answer
      )
    end
  end
end

















#
