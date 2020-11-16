class Profile < ApplicationRecord
  has_one_attached :avatar
  has_many :objects
  belongs_to :user

  def full_name
    "#{first_name} #{last_name}"
  end

  def full_name_with_username
    "#{first_name} #{last_name} (#{username})"
  end
end
