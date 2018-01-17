module MoviesHelper
  def format_total_gross(movie)
    if movie.total_gross_zero?
      "Unknown"
    else
      number_to_currency(movie.total_gross, precision: 0)
    end
  end
end
