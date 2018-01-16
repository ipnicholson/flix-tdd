require 'rails_helper'

describe "Showing an individual movie" do
  it "shows the movie's details" do
    movie = Movie.create(title: "Interstellar",
                          rating: "PG-13",
                          total_gross: "675020017",
                          description: "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.",
                          released_on: "2014-11-07")

    visit "http://example.com/movies/#{movie.id}"

    expect(page).to have_text(movie.title)
    expect(page).to have_text(movie.rating)
    expect(page).to have_text("$675,020,017")
    expect(page).to have_text(movie.description)
    expect(page).to have_text(movie.released_on)
  end
end