class BooksController < ApplicationController
  load_and_authorize_resource

  def index
    if params[:type] == "domestic-literature"
      @books = Book.domestic_literature
    elsif params[:type] == "foreign-literature"
      @books = Book.foreign_literature
    elsif params[:type] == "fiction"
      @books = Book.fiction
    elsif params[:type] == "romance"
      @books = Book.romance
    elsif params[:type] == "history"
      @books = Book.history
    elsif params[:type] == "poetry"
      @books = Book.poetry
    elsif params[:type] == "short-stories"
      @books = Book.short_stories
    elsif params[:type] == "marketing"
      @books = Book.marketing
    elsif params[:type] == "financial-currency"
      @books = Book.financial_currency
    elsif params[:type] == "low"
      @books = Book.low
    elsif params[:type] == "economic-investment"
      @books = Book.economic_investment
    elsif params[:type] == "famous"
      @books = Book.famous
    elsif params[:type] == "computer-science"
      @books = Book.computer_science
    elsif params[:type] == "information-system"
      @books = Book.information_system
    elsif params[:type] == "software-technology"
      @books = Book.software_technology
    elsif params[:type] == "computer-engineering"
      @books = Book.computer_engineering
    elsif params[:type] == "hacker"
      @books = Book.hacker
    elsif params[:type] == "natural-science"
      @books = Book.natural_science
    elsif params[:type] == "social-sciences"
      @books = Book.social_sciences
    elsif params[:type] == "foreign-language"
      @books = Book.foreign_language
    elsif params[:type] == "manga"
      @books = Book.manga
    elsif params[:type] == "arts"
      @books = Book.arts
    elsif params[:type] == "negative"
      @books = Book.negative
    elsif params[:type] == "mystical-science-books"
      @books = Book.mystical_science_books
    elsif params[:type] == "family-cookbook"
      @books = Book.family_cookbook
    elsif params[:type] == "historical-geography"
      @books = Book.historical_geography
    elsif params[:type] == "agriculture-and-forestry"
      @books = Book.agriculture_and_forestry
    elsif params[:type] == "sports-books"
      @books = Book.sports_books
    elsif params[:type] == "political-books-philosophy"
      @books = Book.political_books_philosophy
    else
      @books = @search.result
    end
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
