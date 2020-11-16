class AddPhoneNumberToProfile < ActiveRecord::Migration[6.0]
  def change
    add_column :profiles, :phone_number, :string
    add_column :profiles, :address, :string
  end
end
