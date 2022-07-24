class AddCarImagesToCarPosts < ActiveRecord::Migration[6.1]
  def change
    add_column :car_posts, :car_images, :json
  end
end
