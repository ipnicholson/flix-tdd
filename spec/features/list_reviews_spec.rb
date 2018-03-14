require 'rails_helper'

describe "Viewing a list of reviews" do
  it "shows the movie name and associated reviews" do
    movie = Movie.create( title: "Interstellar",
                          rating: "PG-13",
                          total_gross: 675020017,
                          description: "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.",
                          director: "Christopher Nolan",
                          cast: "Matthew McConaughey, Jessica Chastain, Anne Hathaway, Michael Caine",
                          released_on: "2014-11-07",
                          duration: "169 min",
                          poster_image: open("#{Rails.root}/app/assets/images/interstellar.jpg")
                        )

    review_1 = Review.create( name: "John Public",
                              comment: "Was expecting more explosions and Megan Fox...",
                              stars: 2,
                              movie_id: 1
                            )

    review_2 = Review.create( name: "Bruce Wayne",
                              comment: "I fight crime in a rubber suit all day; really seals in the flavor.",
                              stars: 4,
                              movie_id: 1
                            )

    review_3 = Review.create( name: "Hulk",
                              comment: "lemme smash",
                              stars: 5,
                              movie_id: 1
                            )

    visit movie_reviews_path(movie)

    expect(page).to have_text("Interstellar")
    expect(page).to have_text("3 Reviews")
    expect(page).to have_text("John Public")
    expect(page).to have_text("Was expecting more explosions and Megan Fox...")
    expect(page).to have_text("Bruce Wayne")
    expect(page).to have_text("Hulk")

  end
end