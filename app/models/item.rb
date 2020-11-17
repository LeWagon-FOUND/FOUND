class Item < ApplicationRecord
  belongs_to        :user
  has_one_attached  :photo

  validates         :name, presence: true
  validates         :message, presence: true
  validates         :notification, inclusion: { in: ["true", "false"] }
end
