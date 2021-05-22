class SearchesController < ApplicationController
  before_action :authenticate_user!

  def search
    @range = params[:range]

    if @range == "User"
      @user = User.looks(params[:search], params[:word])
    else
      @blog = Blog.looks(params[:search], params[:word])
    end
  end

  def search_country
    country_code = params[:country_name]
    @country = Blog.where("country_name = ?", country_code)
    @country = Blog.page(params[:page]).per(16)
  end
end
