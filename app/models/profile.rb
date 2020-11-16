class Profile < ApplicationRecord
  has_one_attached :avatar
  has_many :objects
  belongs_to :user
  has_one :user

  def full_name
    "#{first_name} #{last_name}"
  end

  def incomplete_name
    "#{first_name} #{last_name[0]}"
  end
end
