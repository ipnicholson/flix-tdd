require 'rails_helper'

describe "Navigating movies" do
  it "allows navigation from detail page to listing page" do
    movie = Movie.create(movie_attributes)

    visit movie_url(movie)

    click_link "All Movies"

    expect(current_path).to eq(movies_path)
  end

  it "allows navigation from listing page to detail page" do
    movie = Movie.create(movie_attributes)

    visit movies_url

    click_link movie.title

    expect(current_path).to eq(movie_path(movie))
  end

  it "allows navigation from detail page to edit page" do
    movie = Movie.create(movie_attributes)

    visit movie_url(movie)

    click_link "Edit"

    expect(current_path).to eq(edit_movie_path(movie))

  end

  it "allows navigation from the listing page to new movie page" do
    visit movies_url

    click_link "Add Movie"

    expect(current_path).to eq(new_movie_path)
  end

  it "allows canceling creating a new movie" do
    visit new_movie_url

    click_link "Cancel"

    expect(current_path).to eq(movies_path)
  end

  it "allows canceling editing a new movie" do
    movie = Movie.create(movie_attributes)

    visit movie_path(movie)

    click_link "Edit"
    click_link "Cancel"

    expect(current_path).to eq(movies_path)
  end

  it "allows navigation from show page to reviews page" do
    movie = Movie.create(movie_attributes)

    visit movie_url(movie)
    click_link("0 Reviews")

    expect(current_path).to eq(movie_reviews_path(movie))
  end

  it "allows navigation from show page to new review page" do
    movie = Movie.create(movie_attributes)

    visit movie_url(movie)
    click_link("Add Review")

    expect(current_path).to eq(new_movie_review_path(movie))
  end

end