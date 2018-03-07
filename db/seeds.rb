# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Movie.create!([
  {
    title: "Interstellar",
    rating: "PG-13",
    total_gross: 675020017,
    description: "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.",
    released_on: "2014-11-07",
    director: "Christopher Nolan",
    cast: "Matthew McConaughey, Anne Hathaway, Jessica Chastain, Michael Caine",
    duration: "169 min",
    image_file_name: "interstellar.jpg"
  },
  {
    title: "Dunkirk",
    rating: "PG-13",
    total_gross: 525573161,
    description: "Allied soldiers from Belgium, the British Empire and France are surrounded by the German Army, and evacuated during a fierce battle in World War II.",
    released_on: "2017-07-21",
    director: "Christopher Nolan",
    cast: "Fionn Whitehead, Harry Styles, Tom Hardy, Kenneth Branagh",
    duration: "106 min",
    image_file_name: "dunkirk.jpg"
  },
  {
    title: "Damnation",
    rating: "Not Rated",
    total_gross: 0,
    description: "This powerful film odyssey across America explores the sea change in our national attitude from pride in big dams as engineering wonders to the growing awareness that our own future is bound to the life and health of our rivers.",
    released_on: "2014-03-10",
    director: "Ben Knight, Travis Rummel",
    cast: "",
    duration: "87 min",
    image_file_name: "damnation.jpg"
  },
  {
    title: "Kubo and the Two Strings",
    rating: "PG",
    total_gross: 76257813,
    description: "A young boy named Kubo must locate a magical suit of armour worn by his late father in order to defeat a vengeful spirit from the past.",
    released_on: "2016-08-19",
    director: "Travis Knight",
    cast: "Charlize Theron, Art Parkinson, Matthew McConaughey",
    duration: "101 min",
    image_file_name: "kuboandthetwostrings.jpg"
  }
])

Review.create!([
  {
    name: "John Public",
    comment: "Was expecting more explosions and Megan Fox...",
    stars: 2,
    movie_id: 1
  },
  {
    name: "John Public",
    comment: "wut",
    stars: 1,
    movie_id: 2
  },
  {
    name: "John Public",
    comment: "I have bad taste, but this was great!",
    stars: 4,
    movie_id: 3
  },
  {
    name: "John Public",
    comment: "I didn't get it...",
    stars: 3,
    movie_id: 4
  },
  {
    name: "Hulk",
    comment: "lemme smash",
    stars: 4,
    movie_id: 4
  },
  {
    name: "Bruce Wayne",
    comment: "I fight crime all day in a rubber suit; really seals in the flavor.",
    stars: 1,
    movie_id: 4
  },
  {
    name: "Bernie Sanders",
    comment: "YUUUUUGE",
    stars: 5,
    movie_id: 4
  },
  {
    name: "Peter Quill",
    comment: "I'm pretty sure the answer is \"I am Groot.\"",
    stars: 4,
    movie_id: 3
  },
])