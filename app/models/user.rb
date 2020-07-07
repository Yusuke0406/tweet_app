class User < ApplicationRecord
  validates :name, presence:true, length: { maximum: 8 }
  validates :email, {uniqueness:true, presence:true}
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  
  mount_uploader :image, ImageUploader
  has_many :tweets, dependent: :delete_all
  has_many :likes, dependent: :delete_all
  has_many :comments, dependent: :delete_all
end