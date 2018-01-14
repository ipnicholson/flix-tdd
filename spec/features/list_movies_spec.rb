require 'rails_helper'

describe "Viewing the list of movies" do
  it "shows the event" do
    visit "http://example.com/movies"

    expect(page).to have_text("3 Events") # page is an object from Capybara
  end
end