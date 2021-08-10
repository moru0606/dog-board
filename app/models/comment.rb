class Comment < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :post
  belongs_to :user
  validates :comment, presence: true
end
