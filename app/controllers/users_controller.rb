class UsersController < ApplicationController
  before_action :authenticate_user!, except: [:index]
  
  def follow
    @user = User.find(params[:id])
  end

  def followed
    @user = User.find(params[:id])
  end
  
  def index
    @users = User.where(is_deleted: false)
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
    if @user != current_user
      redirect_to users_path, alert: '不正なアクセスです'
    end
  end

  def update
    @user = User.find(params[:id])
    if@user.update(user_params)
    redirect_to user_path(@user)
    else
    render :edit
    end
  end 

  def withdraw
  end
  
  def change
    current_user.unsubscribe!
      sign_out current_user
    redirect_to root_path
    
  end

private 
  def user_params
    params.require(:user).permit(:username,:email,:profile,:profile_image,:is_deleted)
  end
end
