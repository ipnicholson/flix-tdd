module ReviewsHelper
  def format_review_stars(review)
    "⭐️" * review.stars
  end
end
