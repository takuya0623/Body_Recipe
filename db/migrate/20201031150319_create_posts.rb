class CreatePosts < ActiveRecord::Migration[5.2]
  def change
    create_table :posts do |t|
      t.integer :user_id, null: false
      t.string :image_id, null: false
      t.string :title, null: false
      t.text :body
      t.text :procedure, null: false
      t.text :material, null: false
      t.string :calorie, null: false
      t.boolean :is_light, null: false, default: false
      t.timestamps
    end
  end
end
