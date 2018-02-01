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

  it "is released when the released date is in the past" do
    movie = Movie.create(movie_attributes(released_on: 1.month.ago))

    expect(Movie.released).to include(movie)
  end

  it "is not released when the release date is in the future" do
    movie = Movie.create(movie_attributes(released_on: 1.month.from_now))

    expect(Movie.released).to_not include(movie)
  end

  it "returns released movies ordered with the most recently-released movie first" do
    movie1 = Movie.create(movie_attributes(released_on: 3.months.ago))
    movie2 = Movie.create(movie_attributes(released_on: 2.months.ago))
    movie3 = Movie.create(movie_attributes(released_on: 1.month.ago))

    expect(Movie.released).to eq([movie3, movie2, movie1])
  end

  it "returns recently-added movies with the most recently-added movie first" do
    movie1 = Movie.create(movie_attributes(title: "Added First"))
    movie2 = Movie.create(movie_attributes(title: "Added Second"))
    movie3 = Movie.create(movie_attributes(title: "Added Third"))

    expect(Movie.recently_added).to eq([movie3, movie2, movie1])
  end

  it "accepts a positive total gross" do
    movie = Movie.create(movie_attributes(total_gross: 100000))

    # movie.valid?

    expect(movie.errors[:total_gross].any?).to eq(false)
  end

  it "requires a description over 24 characters" do
    movie = Movie.create(movie_attributes(description: "X" * 24))

    # movie.valid?

    expect(movie.errors[:description].any?).to eq(true)
  end

  it "accepts a 0 total gross" do
    movie = Movie.create(movie_attributes(total_gross: 0))

    expect(movie.errors[:total_gross].any?).to eq(false)
  end
  
  it "accepts a negative total gross" do
    movie = Movie.create(movie_attributes(total_gross: -100000))
  
    # movie.valid?
  
    expect(movie.errors[:total_gross].any?).to eq(true)
  end

  it "accepts properly formatted image file names" do
    file_names = %w[e.png movie.png movie.jpg movie.gif MOVIE.GIF]
    file_names.each do |file_name|
      movie = Movie.create(movie_attributes(image_file_name: file_name))
      expect(movie.errors[:image_file_name].any?).to eq(false)
    end
  end
  
  it "rejects improperly formatted image file names" do
    file_names = %w[movie .png .jpg .gif movie.doc]
    file_names.each do |file_name|
      movie = Movie.create(movie_attributes(image_file_name: file_name))
      expect(movie.errors[:image_file_name].any?).to eq(true)
    end
  end
end