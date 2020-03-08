class UsersController < ApplicationController
  def index
    @users = User.all.page(params[:page]).per(PER)
    @users_count = @users.total_count
  end

  def show
    @user = User.find(params[:id])
    @posts = @user.posts.page(params[:page]).per(6)
  end
end
