def movie_attributes(overrides = {})
  {
    title: "Interstellar",
    rating: "PG-13",
    total_gross: 675020017,
    description: "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.",
    released_on: "2014-11-07"
  }.merge(overrides)
end