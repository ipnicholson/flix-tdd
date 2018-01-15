require 'rails_helper'

describe "Viewing the list of movies" do
  it "shows the movies" do
    movie1 = Movie.create(title: "Interstellar",
                          rating: "PG-13",
                          total_gross: "675020017",
                          description: "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.",
                          released_on: "2014-11-07")

    movie2 = Movie.create(title: "Dunkirk",
                          rating: "PG-13",
                          total_gross: "525573161",
                          description: "Allied soldiers from Belgium, the British Empire and France are surrounded by the German Army, and evacuated during a fierce battle in World War II.",
                          released_on: "2017-07-21")

    movie3 = Movie.create(title: "Kubo and the Two Strings",
                          rating: "PG",
                          total_gross: "76257813",
                          description: "A young boy named Kubo must locate a magical suit of armour worn by his late father in order to defeat a vengeful spirit from the past.",
                          released_on: "2016-08-19")

    visit movies_url

    expect(page).to have_text("3 Movies") # page is an object from Capybara
    expect(page).to have_text(movie1.title)
    expect(page).to have_text(movie2.title)
    expect(page).to have_text(movie3.title)

    expect(page).to have_text(movie1.rating)
    expect(page).to have_text("$675,020,017")
    expect(page).to have_text(movie1.description[0...9])
    expect(page).to have_text(movie1.released_on)
  end
end