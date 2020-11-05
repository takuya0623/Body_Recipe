class CreateCarolies < ActiveRecord::Migration[5.2]
  def change
    create_table :carolies do |t|

      t.string :name, null: false
      t.string :calorie, null: false
      t.string :weight, null: false
      t.boolean :is_active, null: false, default: true
      t.timestamps
    end
  end
end
