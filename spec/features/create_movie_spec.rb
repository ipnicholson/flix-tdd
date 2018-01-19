require 'rails_helper'

describe "Creating a new movie" do
  it "has blank inputs for movie details" do
    visit new_movie_url

    expect(find_field("Title").value).to eq(nil)
    expect(find_field("Description").value).to eq("")
    expect(find_field("Rating").value).to eq(nil)
    expect(find_field("Released on").value).to eq(nil)
    expect(find_field("Total gross").value).to eq(nil)
  end

  it "saves the movie and shows the new movie's details" do
    visit new_movie_url

    expect(current_path).to eq(new_movie_path)

    fill_in "Title",        with: "Test Movie Title"
    fill_in "Description",  with: "Test movie description"
    fill_in "Released on",  with: "2017-01-01"    
    fill_in "Rating",       with: "Test movie rating"
    fill_in "Total gross",  with: 123456789

    click_button ("Create Movie")

    expect(page).to have_text("Test Movie Title")
  end

end