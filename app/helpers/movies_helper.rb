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
end
