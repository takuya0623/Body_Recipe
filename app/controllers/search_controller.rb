class SearchController < ApplicationController
  def search
    #Viewのformで取得したパラメータをモデルに渡す
    @calories = Calorie.search(params[:search])
  end
end
