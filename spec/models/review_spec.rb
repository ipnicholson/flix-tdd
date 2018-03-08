require 'rails_helper'

describe "A review" do
  it "belongs to a movie" do
    movie = Movie.create(movie_attributes)
    review = movie.reviews.new(review_attributes)

    expect(review.movie).to eq(movie)
  end

  it "with example attributes is valid" do
    movie = Movie.create(movie_attributes)
    review = Review.new(review_attributes)

    review.movie = movie

    expect(review.valid?).to eq(true)
  end

  it "requires a name" do
    review = Review.create(review_attributes(name: ""))

    expect(review.errors[:name].any?).to eq(true)
  end

  it "requires a comment" do
    review = Review.create(review_attributes(comment: ""))

    expect(review.errors[:comment].any?).to eq(true)
  end

  it "requires a comment over 1 character" do
    review = Review.create(review_attributes(comment: "X"))

    expect(review.errors[:comment].any?).to eq(true)
  end

  it "rejects invalid star values" do
    stars = [-1, 0, 6]

    stars.each do |star|
      review = Review.create(review_attributes(stars: star))

      expect(review.errors[:stars].any?).to eq(true)
    end

  end

  it "accepts star values of 1 through 5" do
    stars = Array (1..5)

    stars.each do |star|
      review = Review.create(review_attributes(stars: star))

      expect(review.errors[:stars].any?).to eq(false)
    end

  end

end