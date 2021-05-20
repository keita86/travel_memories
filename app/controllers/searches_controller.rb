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
end
