require 'rails_helper'

describe "Viewing the list of movies" do
  it "shows the events" do
    visit "http://example.com/movies"

    expect(page).to have_text("3 Movies") # page is an object from Capybara
    expect(page).to have_text("Movie 1")
    expect(page).to have_text("Movie 2")
    expect(page).to have_text("Movie 3")
  end
end