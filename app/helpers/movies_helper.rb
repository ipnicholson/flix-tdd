module MoviesHelper

  def format_total_gross(movie)
    if movie.total_gross_zero?
      content_tag(:em, "Unknown")
    else
      number_to_currency(movie.total_gross, precision: 0)
    end
  end

  def image_for(movie)
    if movie.image_file_name.blank?
      image_tag "placeholder.png"
    else
      image_tag movie.image_file_name
    end
  end

  def format_average_stars(movie)
    average = movie.average_stars
    if average.nil?
      content_tag(:strong, "No Stars")
    else
      pluralize(average.round(2), "Star")
    end
  end

  def format_star_display(movie)
    average = movie.average_stars
    unless average.nil?
      "⭐️" * average.floor
    end
  end

  # currently unused
  def format_recent_reviews(movie)
    movie.recent_reviews.each do |review|
      review.comment
    end
  end
end
