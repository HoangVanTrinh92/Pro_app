class ReviewsController < ApplicationController
  before_action  :load_book
  before_action  :load_review, only: :destroy

  def create
    @book = Book.find params[:book_id]
    @review = @book.reviews.new review_params
    if @review.save
      respond_to do |format|
        format.js
      end
    end
  end

  def destroy
    @review.destroy
    redirect_to book_path @book, notice: 'Review was successfully destroyed.'
  end

  private
  def load_book
    @book = Book.find params[:book_id]
  end

  def load_review
    @review = @book.reviews.find params[:id]
  end

  def review_params
    params.require(:review).permit :user_id, :book_id, :content
  end
end
