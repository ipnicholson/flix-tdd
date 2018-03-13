require 'rails_helper'

describe "Viewing a list of reviews" do
  it "shows the movie name and associated reviews" do
    movie1 = Movie.create(title: "Interstellar",
                          rating: "PG-13",
                          total_gross: 675020017,
                          description: "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.",
                          released_on: "2014-11-07")

    review1 = Review.create(name: "John Public",
                            comment: "Was expecting more explosions and Megan Fox...",
                            stars: 2,
                            movie_id: 1
    )
    review2 = Review.create(name: "Bruce Wayne",
                            comment: "I fight crime in a rubber suit all day; really seals in the flavor.",
                            stars: 4,
                            movie_id: 1
    )
    review3 = Review.create(name: "Hulk",
                            comment: "lemme smash",
                            stars: 5,
                            movie_id: 1
    )

    visit movie_reviews_path(movie1)

    expect(page).to have_text("Interstellar")
    expect(page).to have_text("3 Reviews")
    expect(page).to have_text("John Public")
    expect(page).to have_text("Was expecting more explosions and Megan Fox...")
    expect(page).to have_text("Bruce Wayne")
    expect(page).to have_text("Hulk")

  end
end