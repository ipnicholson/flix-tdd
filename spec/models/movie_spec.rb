require 'rails_helper'

describe "A movie" do
  it "shows total gross of 'Unknown' if total gross is $0" do
    movie = Movie.new(total_gross: 0)

    expect(movie.total_gross_zero?).to eq(true)
  end

  it "shows total gross if total gross is non-$0" do
    movie = Movie.new(total_gross: 123456)
    
    expect(movie.total_gross_zero?).to eq(false)
  end
  
  it "shows total gross of 'Unknown' if total gross is blank" do
    movie = Movie.new(total_gross: nil)
    
    expect(movie.total_gross_zero?).to eq(true)
  end
end