def movie_attributes(overrides = {})
  {
    title: "Interstellar",
    rating: "PG-13",
    total_gross: 675020017,
    description: "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.",
    director: "Christopher Nolan",
    cast: "Matthew McConaughey, Jessica Chastain, Anne Hathaway, Michael Caine",
    released_on: "2014-11-07",
    duration: "169 min",
    image_file_name: "interstellar.jpg"
  }.merge(overrides)
end