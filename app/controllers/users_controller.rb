class UsersController < ApplicationController
  before_action :authenticate_user!

  def index
    @users = User.page(params[:page]).per(30).order(created_at: :desc)
  end

  def show
    @user = User.find(params[:id])
    @blogs = @user.blogs.page(params[:page]).per(20).order(created_at: :desc)
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    @user.update(user_params)
    redirect_to user_path(@user)
  end

  def confirm
    @user = current_user
  end

  def destroy
    user = current_user
    user.destroy
    # reset_session
    flash[:notice] = "退会処理を実行いたしました"
    redirect_to root_path
  end


  private

  def user_params
    params.require(:user).permit(:name, :profile_image, :introduction, :home_image)
  end

end
