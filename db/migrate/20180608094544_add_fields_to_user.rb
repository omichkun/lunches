class AddFieldsToUser < ActiveRecord::Migration[5.2]
  def change
    add_column :users, :about, :text
    add_column :users, :contact_phone, :string
  end
end
