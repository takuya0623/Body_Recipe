class ChangeCaroliesToCalories < ActiveRecord::Migration[5.2]
  def change
    rename_table :carolies, :calories
  end
end
