class ReviewsController < ApplicationController
  def index
    @movie = Movie.find(params[:movie_id])
    @reviews = @movie.reviews
  end

  def new
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.new
  end

  def create
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.new(review_params)

    if @review.save
      redirect_to movie_reviews_path(@movie), notice: "Review sucessfully added!"
    else
      render :new
    end
  end

  def show
    @movie = Movie.find(params[:movie_id])
    @review = @movie.reviews.find([:id])
  end

  private
    def review_params
      review_params = params.require(:review).
        permit( :name,
                :stars,
                :comment
        )
    end

end
