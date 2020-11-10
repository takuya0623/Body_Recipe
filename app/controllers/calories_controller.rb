class CaloriesController < ApplicationController

  def index
    @calories = Calorie.page(params[:page]).per(10).where(is_active: true).order(:yomi)
  end

end
