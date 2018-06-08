class CreateOrders < ActiveRecord::Migration[5.2]
  def change
    create_table :orders do |t|
      t.references :user, foreign_key: true
      t.integer :first_course_id, index: true
      t.integer :main_course_id, index: true
      t.integer :drink_id, index: true
      t.timestamps
    end
  end
end
