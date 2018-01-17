require 'rails_helper'

describe "Navigating movies " do
  it "allows navigation from detail page to listing page" do
    movie = Movie.create(movie_attributes)

    visit movie_url(movie)

    click_link "All Movies"

    expect(current_path).to eq(movies_path)
  end
  
  it "allows navigation from listing page to detail page" do
    movie = Movie.create(movie_attributes)
    
    visit movies_url

    click_link movie.title

    expect(current_path).to eq(movie_path(movie))
  end

end