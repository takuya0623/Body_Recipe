class AddYomiToCalories < ActiveRecord::Migration[5.2]
  def change
    add_column :calories, :yomi, :string
  end
end
