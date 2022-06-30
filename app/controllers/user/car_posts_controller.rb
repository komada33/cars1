class User::CarPostsController < ApplicationController
  def new
    @car_post = CarPost.new
  end

  def create
    @car_post = CarPost.new(car_post_params)
    @car_post.user_id = current_user.id
    if @car_post.save
      redirect_to car_posts_path
    else
      render 'new'
    end
  end

  def index
    @car_posts = CarPost.all
  end

  def show
    @car_post = CarPost.find(params[:id])
  end

  def edit
    @car_post = CarPost.find(params[:id])
  end

  def update
    @car_post = CarPost.find(params[:id])
    @car_post.update(car_post_params)
    redirect_to car_post_path(@car_post.id)
  end

  def destroy
    @car_post = CarPost.find(params[:id])
    @car_post.destroy
      redirect_to car_posts_path
  end

  private
  def car_post_params
    params.require(:car_post).permit(:title, :message, :user_id, :parts_genre_id, :car_image)
  end
end
