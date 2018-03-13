require 'rails_helper'

describe "Destroying a review" do
  it "destroys the review and redirects to a reviews listing page without the deleted review; shows flash messaging" do
    movie = Movie.create(movie_attributes)

    movie.reviews.create(review_attributes)

    review = movie.reviews.first

    visit movie_review_path(movie, review)

    expect(page).to have_text("John Public")
    expect(page).to have_text("I have bad taste, but this was great!")

    click_link "Delete"

    expect(page).to have_text("Review successfully deleted!")
    expect(page).to_not have_text("John Public")
    expect(page).to_not have_text("I have bad taste, but this was great!")
  end

end