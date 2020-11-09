class CaloriesController < ApplicationController

  def index
    @calories = Calorie.where(is_active: true).order(:yomi)
    
  end

end
