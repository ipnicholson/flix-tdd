require 'rails_helper'

describe "Creating a review" do

  it "saves the review and shows the new review's details" do
    movie = Movie.create(movie_attributes)

    visit new_movie_review_path(movie)

    fill_in "Name",     with: "Reviewer McReviewface"
    select 5,          :from => "Stars"
    fill_in "Comment",  with: "What about the droid attack on the wookies?"

    click_button ("Create Review")

    expect(page).to have_text("Reviewer McReviewface")
    expect(page).to have_text("5 Stars")
    expect(page).to have_text("What about the droid attack on the wookies?")
  end

end