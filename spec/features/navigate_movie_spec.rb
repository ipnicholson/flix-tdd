require 'rails_helper'

describe "Navigating movies " do
  it "allows navigation from detail page to listing page" do
    movie = Movie.create( title: "Interstellar",
                          rating: "PG-13",
                          total_gross: 675020017,
                          description: "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.",
                          released_on: "2014-11-07")

    visit movie_url(movie)

    click_link "All Movies"

    expect(current_path).to eq(movies_path)
  end
  
  it "allows navigation from listing page to detail page" do
    movie = Movie.create( title: "Interstellar",
                          rating: "PG-13",
                          total_gross: 675020017,
                          description: "A team of explorers travel through a wormhole in space in an attempt to ensure humanity's survival.",
                          released_on: "2014-11-07")
    
    visit movies_url

    click_link "Interstellar"

    expect(current_path).to eq(movie_url(movie))
  end

end