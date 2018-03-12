require 'rails_helper'

describe "Viewing an individual review" do

  it "shows the review's details" do
    movie = Movie.create(movie_attributes)

    review = movie.reviews.create(review_attributes)

    visit movie_review_url(movie, review)

    expect(page).to have_text("Interstellar")
    expect(page).to have_text("John Public")
    expect(page).to have_text("I have bad taste, but this was great!")
    expect(page).to have_text("Edit")
    expect(page).to have_text("Delete")
  end

end
