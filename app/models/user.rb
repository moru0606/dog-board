# frozen_string_literal: true

class User < ApplicationRecord
  before_save { email.downcase! }
  validates :name, presence: true, length: { maximum: 50 }
  validates :profile, length: { maximum: 255 }
  validates :email, presence: true, length: { maximum: 255 },
                    format: { with: /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i },
                    uniqueness: { case_sensitive: false }
  has_secure_password

  mount_uploader :image, ImageUploader

  has_many :posts
  has_many :comments
  has_many :likes
  has_many :like_posts, through: :likes, source: :post

  def like(post)
    likes.find_or_create_by(post_id: post.id)
  end

  def unlike(post)
    like = likes.find_by(post_id: post.id)
    like.destroy if like
  end

  def like?(post)
    like_posts.include?(post)
  end
end
