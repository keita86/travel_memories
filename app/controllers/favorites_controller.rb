class FavoritesController < ApplicationController
  before_action :set_variables

  def create
    # blog = Blog.find(params[:blog_id])
    favorite = current_user.favorites.new(blog_id: @blog.id)
    favorite.save
    # redirect_to request.referer
  end

  def destroy
    # blog = Blog.find(params[:blog_id])
    favorite = current_user.favorites.find_by(blog_id: @blog.id)
    favorite.destroy
    # redirect_to request.referer
  end

  def set_variables
    @blog = Blog.find(params[:blog_id])
    @id_name = "#favorite-link-#{@blog.id}"
  end
end
