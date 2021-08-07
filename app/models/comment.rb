class Comment < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :post
  validates :comment, presence: true
end
