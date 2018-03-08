class Movie < ApplicationRecord

  validates :title, :rating, :released_on, presence: true

  RATINGS = %w[G PG PG-13 R NC-17] << "Not Rated"
  validates :rating, inclusion: { in: RATINGS }

  validates :description, length: { minimum: 25 }

  validates :total_gross, numericality: { greater_than_or_equal_to: 0 }

  validates :image_file_name, allow_blank: true, format: {
    with: /\w+.(gif|jpg|png)/i,
    message: "Must be .gif, .jpg, or .png file name"
  }

  has_many :reviews, dependent: :destroy

  def total_gross_zero?
    total_gross.blank? || total_gross.zero?
  end

  def self.released
    date = Time.now
    Movie.where('released_on <= ?', date).order("released_on desc")
  end

  def self.recently_added
    order("created_at desc")
  end

  def average_stars
    reviews.average(:stars)
  end

  def recent_reviews # returns array of two most recent reviews
    reviews.order('created_at').limit(2)
  end

end
