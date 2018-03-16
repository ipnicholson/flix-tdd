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
    poster_image: open("#{Rails.root}/app/assets/images/interstellar.jpg")
  }.merge(overrides)
end

def review_attributes(overrides = {})
  {
    name: "John Public",
    comment: "I have bad taste, but this was great!",
    stars: 4
  }.merge(overrides)
end

def review_attributes_2(overrides = {})
  {
    name: "HULK",
    comment: "LEMME SMASH",
    stars: 5
  }.merge(overrides)
end