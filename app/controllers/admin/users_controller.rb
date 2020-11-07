class Admin::UsersController < ApplicationController
  before_action :authenticate_admin_admin!
  def index
    @users = User.all
  end

  def show
    @user = User.find(params[:id])
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
  @user=User.find(params[:id])
    if @user.update(user_params)
      flash[:notice]="会員ステータスを編集しました。"
      redirect_to admin_users_path
    else
      flash.now[:error]="入力内容に誤りがあります。"
      render:edit
    end
  end

  private
  def user_params
    params.require(:user).permit(:is_deleted)
  end

end
