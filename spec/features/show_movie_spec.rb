require 'rails_helper'

describe "Viewing an individual movie" do
  it "shows the movie's details" do
    movie = Movie.create(movie_attributes)

    visit movie_url(movie)

    expect(page).to have_text(movie.title)
    expect(page).to have_text(movie.rating)
    expect(page).to have_text(movie.description)
    expect(page).to have_text(movie.director)
    expect(page).to have_text(movie.cast)
    expect(page).to have_text(movie.released_on)
    expect(page).to have_text(movie.duration)
  end

  it "shows the total gross if not $0" do
    movie = Movie.create(movie_attributes(total_gross: 123456))

    visit movie_url(movie)

    expect(page).to have_text("$123,456")
  end

  it "shows 'Unknown' if total gross is $0" do
    movie = Movie.create(movie_attributes(total_gross: 0))

    visit movie_url(movie)

    expect(page).to have_text("Unknown")
  end
end