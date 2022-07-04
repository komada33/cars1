class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_one_attached :plofile_image

  belongs_to :maker_genre
  has_many :car_posts, dependent: :destroy
  has_many :comments

  def get_plofile_image(width, height)
    unless plofile_image.attached?
      file_path = Rails.root.join('app/assets/images/no_image.jpg')
      plofile_image.attach(io: File.open(file_path),filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    plofile_image.variant(resize_to_limit: [width, height]).processed

  end

end