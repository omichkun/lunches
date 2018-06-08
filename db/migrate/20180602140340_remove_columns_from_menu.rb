class RemoveColumnsFromMenu < ActiveRecord::Migration[5.2]
  def change
    remove_column :menus, :name
    remove_column :menus, :menu_date
  end
end
