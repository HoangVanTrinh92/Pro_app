class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :search_form

  rescue_from CanCan::AccessDenied do |exception|
    flash[:alert] = exception.message
    redirect_to current_user ? root_url : new_user_session_path
  end

  private
  def search_form
    @search = Book.all.search params[:q]
  end
end
