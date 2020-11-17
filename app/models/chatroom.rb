class Chatroom < ApplicationRecord
  has_many :messages

  validates  :name,           presence: true
  validates  :finder_user_id, presence: true
  validates  :user_id,        presence: true
end
