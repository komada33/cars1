class CarPost < ApplicationRecord

  has_one_attached :car_image
  belongs_to :parts_genre
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :goods, dependent: :destroy

  def gooded?(user)
    goods.where(user_id: user.id).exists?
  end
end