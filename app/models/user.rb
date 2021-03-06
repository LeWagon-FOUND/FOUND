class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :items
  has_one_attached :avatar

  def full_name
    "#{first_name} #{last_name}"
  end

  def incomplete_name
    "#{first_name} #{last_name[0]}"
  end
end
