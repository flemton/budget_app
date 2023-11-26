class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :entities
  has_many :groups

  validates :name, length: { minimum: 2, maximum: 50 }

  mount_uploader :profile_photo, ProfilePhotoUploader
end
