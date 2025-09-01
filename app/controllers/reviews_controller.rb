class ReviewsController < ApplicationController
  before_action :set_book_from_id,   only: [:index, :new, :create]
  before_action :set_review, only: [:show, :edit, :update, :destroy]

  def index
    @reviews = @book.reviews.order(created_at: :desc)
  end

  def show; end

  def new
    @review = @book.reviews.new
  end

  def create
    @review = @book.reviews.new(review_params)
    if @review.save
      redirect_to review_path(@review), notice: "Review added!"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @review.update(review_params)
      redirect_to review_path(@review), notice: "Review updated!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy

    review = Review.find(params[:id])
    book   = review.book
    review.destroy
    redirect_to book_path(book), notice: "Review deleted!", status: :see_other
  end
end

  private
  def set_book_from_id
    @book = Book.find(params[:book_id])
  end

  def set_review
    @review = Review.find(params[:id])
  end

  def review_params
    params.fetch(:review, {}).permit(:reviewer_name, :body, :rating)
  end

