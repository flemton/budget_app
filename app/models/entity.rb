class Entity < ApplicationRecord
  belongs_to :user
  belongs_to :group

  validates :name, presence: true
  validates :name, length: { minimum: 2, maximum: 50 }
  validates :amount, presence: true, numericality: { greater_than: 0 }
end
