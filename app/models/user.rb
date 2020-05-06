class User < ApplicationRecord
  validates :image, presence: true
  validates :email, {uniqueness:true, presence:true}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  mount_uploader :image, ImageUploader
  has_many :tweets, dependent: :delete_all
  has_many :likes, dependent: :delete_all
  has_many :comments, dependent: :delete_all
end
