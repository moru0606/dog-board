# frozen_string_literal: true

class Comment < ApplicationRecord
  mount_uploader :image, ImageUploader
  belongs_to :post
  belongs_to :user

  validates :comment, presence: true, length: { maximum: 255 }
end
