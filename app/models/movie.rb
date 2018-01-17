class Movie < ApplicationRecord
  def total_gross_zero?
    total_gross.blank? || total_gross.zero?
  end
end
