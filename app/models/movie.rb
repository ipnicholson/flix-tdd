class Movie < ApplicationRecord

  validates :title, :rating, :released_on, presence: true

  RATINGS = %w[G PG PG-13 R NC-17] << "Not Rated"
  validates :rating, inclusion: { in: RATINGS }

  validates :description, length: { minimum: 25 }

  validates :total_gross, numericality: { greater_than_or_equal_to: 0 }

  # Paperclip method
  has_attached_file :poster_image

  validates_attachment :poster_image, presence: true,
    # Ensure file is of correct type and not just correct file extension
    content_type: { content_type: ["image/jpeg", "image/png"] },
    size: { in: 0..1.megabytes }

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
    reviews.order('created_at desc').limit(2) #desc is short for "descending", not description
  end

end
