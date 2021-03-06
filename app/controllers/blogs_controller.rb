class BlogsController < ApplicationController
  before_action :authenticate_user!

  def new
    @blog = Blog.new
  end

  def create
    @blog = Blog.new(blog_params)
    @blog.user_id = current_user.id
    if @blog.save
      tags = Vision.get_image_data(@blog.image)
      tags.each do |tag|
        @blog.tags.create(name: tag)
      end
      redirect_to blog_path(@blog)
    else
      render "new"
    end
  end

  def index
    @blogs = Blog.page(params[:page]).per(30).order(created_at: :desc)
  end

  def show
    @blog = Blog.find(params[:id])
    gon.blog = @blog
    @blog_comment = BlogComment.new
    @blog_comments = BlogComment.all
  end

  def edit
    @blog = Blog.find(params[:id])
  end

  def update
    @blog = Blog.find(params[:id])
    if @blog.update(blog_params)
      redirect_to blog_path(@blog)
    else
      render "edit"
    end
  end

  def destroy
    @blog = Blog.find(params[:id])
    @blog.destroy
    redirect_to blogs_path
  end

    def daily_rank
      # @days = Blog.this_day
      @days = Blog.joins(:favorites).where(favorites: { created_at: Time.zone.now.all_day})
      .group(:id).order("count(favorites.blog_id) DESC").limit(5)
    end
    def weekly_rank
      # @weeks = Blog.this_week
      @weeks = Blog.joins(:favorites).where(favorites: {created_at: 1.week.ago.beginning_of_day..Time.zone.now.end_of_day})
      .group(:id).order("count(favorites.blog_id) DESC").limit(5)
    end
    def monthly_rank
      # @months = Blog.this_month
      @months = Blog.joins(:favorites).where(favorites: {created_at: Time.now.all_month})
      .group(:id).order("count(favorites.blog_id) DESC").limit(5)
    end



  private

  def blog_params
    params.require(:blog).permit(:title, :image, :description, :country_name, :address)
  end

end
