class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :car_post

  validates :post_comment, presence: true
end