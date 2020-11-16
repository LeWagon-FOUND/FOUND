class Profile < ApplicationRecord
  has_one_attached :avatar
  has_one_attached :qrcode
  has_many :items, through: :users
  belongs_to :user

  def full_name
    "#{first_name} #{last_name}"
  end

  def incomplete_name
    "#{first_name} #{last_name[0]}"
  end
end
