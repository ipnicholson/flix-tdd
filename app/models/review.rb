class Review < ApplicationRecord
  validates :name, :comment, presence: true

  validates :comment, length: { minimum: 2 }

  STARS = (1..5).to_a
  validates :stars, inclusion:  { in: STARS }

  belongs_to :movie
end
