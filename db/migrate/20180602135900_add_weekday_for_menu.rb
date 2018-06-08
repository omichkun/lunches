class AddWeekdayForMenu < ActiveRecord::Migration[5.2]
  def change
    add_column :menus, :weekday, :integer, index: true
  end
end
