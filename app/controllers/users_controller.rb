class UsersController < ApplicationController
  load_and_authorize_resource

  def index
    @users = User.all.paginate page: params[:page]
  end
end
