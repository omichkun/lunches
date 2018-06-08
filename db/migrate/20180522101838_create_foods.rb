class CreateFoods < ActiveRecord::Migration[5.2]
  def change
    create_table :foods do |t|
      t.string :name
      t.integer :food_type
      t.string :image
      t.float :price

      t.timestamps
    end
  end
end
