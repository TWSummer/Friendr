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
  "What can I say other than I am a great friend who totally will not come to your house and watch you while you are sleeping. What more could you ask for?"
]

looking = [
  "10-15 test subjects who will perform humiliating acts on live TV for menial amounts of money. What do you say, friend?",
  "True friendship multiplies the good in life and divides its evils. Strive to have friends, for life without friends is like life on a desert island… to find one real friend in a lifetime is good fortune; to keep them is a blessing.",
  "True friendship comes when the silence between two people is comfortable.",
  "A friend is one that knows you as you are, understands where you have been, accepts what you have become, and still, gently allows you to grow.",
  "Wishing to be friends is quick work, but friendship is a slow ripening fruit.",
  "Do I not destroy my enemies when I make them my friends?",
  "We cannot tell the precise moment when friendship is formed. As in filling a vessel drop by drop, there is at last a drop which makes it run over; so in a series of kindnesses there is at last one which makes the heart run over.",
  ""
]

2.times do
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
end

















#
