class Post < ApplicationRecord
  mount_uploader :image, ImageUploader

  has_many :comments, dependent: :destroy
  has_many :categories
  belongs_to :user
  validates :title, presence: true
  validates :content, presence: true, length: { minimum: 10 }
end
