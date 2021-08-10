class UsersController < ApplicationController
  before_action :require_user_logged_in?, only: %i[show edit]
  before_action :correct_user, only: [:edit]

  def show
    @user = User.find(params[:id])
  end

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      flash[:success] = 'ユーザー登録しました'
      redirect_to @user
    else
      flash[:danger] = 'ユーザー登録に失敗しました'
      render :new
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    @user = User.find(params[:id])
    if @user.update(user_params)
      redirect_to @user
    else
      render :edit
    end
  end
end

private

def user_params
  params.require(:user).permit(:name, :email, :password, :password_confirmation, :image, :profile)
end

def correct_user
  @user = User.find(params[:id])
  unless @user
    flash[:warning] = 'あなたに権限がありません'
    redirect_to root_url
  end
end
