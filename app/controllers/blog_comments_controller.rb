class BlogCommentsController < ApplicationController
  def create
    @blog = Blog.find(params[:blog_id])
    @blog_comment = current_user.blog_comments.new(blog_comment_params)
    @blog_comment.blog_id = @blog.id
    @blog_comment.save
    render :index
    # redirect_to blog_path(blog)
  end

  def destroy
    @blog = Blog.find(params[:blog_id])
    BlogComment.find_by(id: params[:id], blog_id: params[:blog_id]).destroy
    render :index
    # redirect_to blog_path(params[:blog_id])
  end

  private

  def blog_comment_params
    params.require(:blog_comment).permit(:comment)
  end

end
