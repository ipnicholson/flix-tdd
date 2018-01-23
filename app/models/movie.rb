class Movie < ApplicationRecord
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
end
