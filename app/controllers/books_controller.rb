class BooksController < ApplicationController
  def index
    @books = Book.all
  end

  def show
    @book = Book.find params[:id]
    @reviews = @book.reviews
    @new_review = @book.reviews.new
  end

  private
    def book_params
      params.require(:book).permit(:title, :publish_date, :author, 
        :number_page, :category, :picture)
    end
end