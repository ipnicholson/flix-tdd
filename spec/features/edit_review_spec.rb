require 'rails_helper'

describe "Editing a review" do
  it "shows the existing review, updates the review, shows the updated review's details, and shows flash messaging" do
    movie = Movie.create(movie_attributes)
    review = movie.reviews.create(review_attributes)

    visit movie_review_url(movie, review)

    click_link("Edit")

    expect(current_path).to eq(edit_movie_review_path(movie, review))

    expect(find_field("Name").value).to eq(review.name)
    expect(find_field("Comment").value).to eq(review.comment)

    fill_in "Name", with: "Updated Review Name"
    fill_in "Comment", with: "Updated Review Comment"

    click_button("Submit")

    expect(current_path).to eq(movie_review_path(movie, review))

    expect(page).to have_text("Updated Review Name")
    expect(page).to have_text("Updated Review Comment")
    expect(page).to have_text("Review successfully updated!")
  end

  it "does not update the review if it's invalid" do
    movie = Movie.create(movie_attributes)
    review = movie.reviews.create(review_attributes)

    visit movie_review_url(movie, review)

    click_link("Edit")

    fill_in "Name", with: ""
    fill_in "Comment", with: " "

    click_button("Submit")

    expect(current_path).to eq(movie_review_path(movie, review))
    expect(page).to have_text("error")
  end
end