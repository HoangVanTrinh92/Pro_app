class BooksController < ApplicationController
  load_and_authorize_resource

  def index
    case params[:type]
    when "domestic-literature"
      @books = Book.domestic_literature.page params[:page]
    when "foreign-literature"
      @books = Book.foreign_literature.page params[:page]
    when "fiction"
      @books = Book.fiction.page params[:page]
    when "romance"
      @books = Book.romance.page params[:page]
    when "history"
      @books = Book.history.page params[:page]
    when "poetry"
      @books = Book.poetry.page params[:page]
    when "short-stories"
      @books = Book.short_stories.page params[:page]
    when "marketing"
      @books = Book.marketing
    when "financial-currency"
      @books = Book.financial_currency.page params[:page]
    when "low"
      @books = Book.low
    when "economic-investment"
      @books = Book.economic_investment.page params[:page]
    when "famous"
      @books = Book.famous.page params[:page]
    when "computer-science"
      @books = Book.computer_science.page params[:page]
    when "information-system"
      @books = Book.information_system.page params[:page]
    when "software-technology"
      @books = Book.software_technology.page params[:page]
    when "computer-engineering"
      @books = Book.computer_engineering.page params[:page]
    when "hacker"
      @books = Book.hacker.page params[:page]
    when "natural-science"
      @books = Book.natural_science.page params[:page]
    when "social-sciences"
      @books = Book.social_sciences.page params[:page]
    when "foreign-language"
      @books = Book.foreign_language.page params[:page]
    when "manga"
      @books = Book.manga.page params[:page]
    when "arts"
      @books = Book.arts.page params[:page]
    when "negative"
      @books = Book.negative.page params[:page]
    when "mystical-science-books"
      @books = Book.mystical_science_books.page params[:page]
    when "family-cookbook"
      @books = Book.family_cookbook.page params[:page]
    when "historical-geography"
      @books = Book.historical_geography.page params[:page]
    when "agriculture-and-forestry"
      @books = Book.agriculture_and_forestry.page params[:page]
    when "sports-books"
      @books = Book.sports_books.page params[:page]
    when "political-books-philosophy"
      @books = Book.political_books_philosophy.page params[:page]
    else
      @books = @search.result.page params[:page]
    end
  end

  def show
    @book = Book.find params[:id]
    @reviews = @book.reviews
    @new_review = @book.reviews.new
  end

  def update
    if @book.update_attributes book_params
      flash[:success] = t "messages.update_success"
      redirect_to book_path @book
    else
      flash[:dange] = t "messages.update_fail"
      render :show
    end
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
