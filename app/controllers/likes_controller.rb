class LikesController < ApplicationController
  before_action  :load_book
  before_action  :load_like, only: :destroy

  def create
    @book = Book.find params[:book_id]
    @like = @book.likes.new like_params
    if @like.save
      redirect_to book_path @book
    end
  end

  def destroy
    @like.destroy
    redirect_to book_path @book
  end

  private
  def load_book
    @book = Book.find params[:book_id]
  end

  def load_like
    @like = @book.likes.find params[:id]
  end

  def like_params
    params.require(:like).permit Like::ATTRIBUTES_PARAMS
  end
end
