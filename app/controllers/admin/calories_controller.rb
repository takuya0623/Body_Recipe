class Admin::CaloriesController < ApplicationController
  before_action :authenticate_admin_admin!
  
  def index
    @calories = Calorie.order("yomi")

  end
  
  def new
    @calorie = Calorie.new
  end

  def create
    @calorie = Calorie.new(calorie_params)
    if @calorie.save
      redirect_to admin_calories_path
    else
    render :new
    end
  end

  def edit
    @calorie =Calorie.find(params[:id])
  end

  def update
    @calorie = Calorie.find(params[:id])
    if @calorie.update(calorie_params)
      redirect_to admin_calories_path
    else
      render :edit
    end
  end

  def destroy
    calorie = Calorie.find(params[:id])
    calorie.destroy
    redirect_to admin_calories_path
  end



private
  def calorie_params
    params.require(:calorie).permit(:name, :weight, :calorie,:yomi, :is_active)
  end
end