class StaticPagesController < ApplicationController
  def home
    @posts = Post.all.page(params[:page]).per(PER).order('updated_at DESC')
  end

  def about
  end

  def tos
  end
end
