class ApplicationController < ActionController::Base
  before_action :set_search
  PER = 10

  def set_search
    @search = Post.ransack(params[:q])
    @search_posts = @search.result.page(params[:page]).per(PER)
  end
end
