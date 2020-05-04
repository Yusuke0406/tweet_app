class Tweet < ApplicationRecord
  validates :text, presence: true

  belongs_to :user
  has_many :likes, dependent: :delete_all
end
