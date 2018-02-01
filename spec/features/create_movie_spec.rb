require 'rails_helper'

describe "Creating a new movie" do
  it "has blank inputs for movie details" do
    visit new_movie_url

    expect(find_field("Title").value).to eq(nil)
    expect(find_field("Image file").value).to eq("")
    expect(find_field("Description").value).to eq("")
    expect(page).to have_text("Pick One")
    expect(find_field("Director").value).to eq(nil)
    expect(find_field("Cast").value).to eq(nil)
    expect(find_field("Duration").value).to eq(nil)
    expect(find_field("Released on").value).to eq(nil)
    expect(find_field("Total gross").value).to eq(nil)
  end

  it "saves the movie and shows the new movie's details" do
    visit new_movie_url

    expect(current_path).to eq(new_movie_path)

    fill_in "Title",        with: "Movie McMovieface"
    fill_in "Description",  with: "The quick brown fox jumped over the lazy green frog."
    fill_in "Released on",  with: "2017-01-01"    
    select "PG-13", :from => "movie_rating" 
    fill_in "Total gross",  with: 123456789
    fill_in "Director",     with: "Director McDirectorface"
    fill_in "Cast",         with: "Casty McCastface"
    fill_in "Duration",     with: "123 min"
    fill_in "Image file name", with: "placeholder.png"


    click_button ("Create Movie")

    expect(page).to have_text("Movie McMovieface")
    expect(page).to have_text("The quick brown fox")
    expect(page).to have_text("PG-13")
    expect(page).to have_text("Director McDirectorface")
  end

  it "does not save the movie if it's invalid" do
    visit new_movie_url

    expect {
      click_button 'Create Movie'
    }.not_to change(Movie, :count)

    expect(current_path).to eq(movies_path)
    expect(page).to have_text('error')
  end

end