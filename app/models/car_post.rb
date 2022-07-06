class CarPost < ApplicationRecord

  has_one_attached :car_image
  belongs_to :parts_genre
  belongs_to :user
  has_many :comments, dependent: :destroy
  has_many :goods, dependent: :destroy

  def get_car_image(width, height)
    unless car_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      car_image.attach(io: File.open(file_path),filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    car_image.variant(resize_to_limit: [width, height]).processed
  end

  def gooded?(user)
    goods.where(user_id: user.id).exists?
  end
end