class Group < ApplicationRecord
  belongs_to :user
  has_many :entities

  validates :name, presence: true
  validates :name, length: { minimum: 2, maximum: 50 }
  validates :icon, presence: true
end
