require 'rails_helper'

describe "Viewing the list of movies" do
  it "shows the movies" do
    movie_1 = Movie.create(title: "Interstellar",
                          rating: "PG-13",
                          total_gross: 675020017,
                          description: "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.",
                          director: "Christopher Nolan",
                          cast: "Matthew McConaughey, Jessica Chastain, Anne Hathaway, Michael Caine",
                          released_on: "2014-11-07",
                          duration: "169 min",
                          poster_image: open("#{Rails.root}/app/assets/images/interstellar.jpg")
                          )

    movie_2 = Movie.create(title: "Dunkirk",
                          rating: "PG-13",
                          total_gross: 525573161,
                          description: "Allied soldiers from Belgium, the British Empire and France are surrounded by the German Army, and evacuated during a fierce battle in World War II.",
                          released_on: "2017-07-21",
                          director: "Christopher Nolan",
                          cast: "Fionn Whitehead, Harry Styles, Tom Hardy, Kenneth Branagh",
                          duration: "106 min",
                          poster_image: open("#{Rails.root}/app/assets/images/dunkirk.jpg")
                          )

    movie_3 = Movie.create(title: "Damnation",
                          rating: "Not Rated",
                          total_gross: 0,
                          description: "This powerful film odyssey across America explores the sea change in our national attitude from pride in big dams as engineering wonders to the growing awareness that our own future is bound to the life and health of our rivers.",
                          released_on: "2014-03-10",
                          director: "Ben Knight, Travis Rummel",
                          cast: "",
                          duration: "87 min",
                          poster_image: open("#{Rails.root}/app/assets/images/damnation.jpg")
                          )

    visit movies_url

    expect(page).to have_text("3 Movies") # page is an object from Capybara
    expect(page).to have_text(movie_1.title)
    expect(page).to have_text(movie_2.title)
    expect(page).to have_text(movie_3.title)

    expect(page).to have_text(movie_1.rating)
    expect(page).to have_text("$675,020,017")
    expect(page).to have_text(movie_1.description[0...9])
    expect(page).to have_text(movie_1.released_on)
  end

  it "does not show a movie that is yet to be released" do
    movie = Movie.create(movie_attributes(released_on: 1.month.from_now))

    visit movies_path

    expect(page).to_not have_text(movie.title)
  end
end