class AddFieldsToUsers < ActiveRecord::Migration[6.0]
  def change
    add_column :users, :first_name, :text
    add_column :users, :last_name, :text
    add_column :users, :username, :text
    add_column :users, :avatar, :text
    add_column :users, :qrcode, :text
  end
end
