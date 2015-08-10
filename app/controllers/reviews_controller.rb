class ReviewsController < ApplicationController

  def create
    @book = Book.find params[:book_id]
    @review = @book.reviews.new review_params
    if @review.save
      respond_to do |format|
        format.js
      end
    end
  end
  
  private
  def review_params
    params.require(:review).permit :user_id, :book_id, :content
  end
end