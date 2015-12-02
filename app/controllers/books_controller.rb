class BooksController < ApplicationController
  load_and_authorize_resource

  def index
    case params[:type]
    when "domestic-literature"
      @books = Book.domestic_literature
    when "foreign-literature"
      @books = Book.foreign_literature
    when "fiction"
      @books = Book.fiction
    when "romance"
      @books = Book.romance
    when "history"
      @books = Book.history
    when "poetry"
      @books = Book.poetry
    when "short-stories"
      @books = Book.short_stories
    when "marketing"
      @books = Book.marketing
    when "financial-currency"
      @books = Book.financial_currency
    when "low"
      @books = Book.low
    when "economic-investment"
      @books = Book.economic_investment
    when "famous"
      @books = Book.famous
    when "computer-science"
      @books = Book.computer_science
    when "information-system"
      @books = Book.information_system
    when "software-technology"
      @books = Book.software_technology
    when "computer-engineering"
      @books = Book.computer_engineering
    when "hacker"
      @books = Book.hacker
    when "natural-science"
      @books = Book.natural_science
    when "social-sciences"
      @books = Book.social_sciences
    when "foreign-language"
      @books = Book.foreign_language
    when "manga"
      @books = Book.manga
    when "arts"
      @books = Book.arts
    when "negative"
      @books = Book.negative
    when "mystical-science-books"
      @books = Book.mystical_science_books
    when "family-cookbook"
      @books = Book.family_cookbook
    when "historical-geography"
      @books = Book.historical_geography
    when "agriculture-and-forestry"
      @books = Book.agriculture_and_forestry
    when "sports-books"
      @books = Book.sports_books
    when "political-books-philosophy"
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

    def user_relationship
      User.each
    end
end
