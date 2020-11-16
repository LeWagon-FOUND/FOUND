class CreateChatrooms < ActiveRecord::Migration[6.0]
  def change
    create_table :chatrooms do |t|
      t.string :name
      t.references :finder_user, null: false
      t.references :user, null: false

      t.timestamps
    end

  add_foreign_key :chatrooms, :users, column: :finder_user_id
  add_foreign_key :chatrooms, :users, column: :user_id
  end
end
