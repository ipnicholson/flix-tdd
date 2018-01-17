require 'rails_helper'

describe "Editing a movie" do
  it "shows the existing details" do
    movie = Movie.create(movie_attributes)

    visit edit_movie_path(movie)

    expect(page).to have_text(movie.title)
  end
end