class DropProfile < ActiveRecord::Migration[6.0]
  def change
    drop_table :profiles
    add_column :users, :first_name, :string
    add_column :users, :last_name, :string
    add_column :users, :generic_message, :text, default: "Hello, I lost this item, please follow the instructions to contact me!"
    add_column :users, :birthdate, :date
    add_column :users, :svg, :text
  end
end
