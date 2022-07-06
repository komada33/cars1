class User::CarPostsController < ApplicationController
  def new
    @carpost = CarPost.new
  end

  def create
    @carpost = CarPost.new(car_post_params)
    @carpost.user_id = current_user.id
    if @carpost.save
      redirect_to car_posts_path
    else
      render 'new'
    end
  end

  def index
    @carposts = CarPost.all
  end

  def show
    @carpost = CarPost.find(params[:id])
    @comments = @carpost.comments
    @comment = current_user.comments.new
    @good_count = Good.where(car_post_id: @carpost.id).count
  end

  def edit
    @carpost = CarPost.find(params[:id])
  end

  def update
    @carpost = CarPost.find(params[:id])
    @carpost.update(car_post_params)
    redirect_to car_post_path(@carpost.id)
  end

  def destroy
    @carpost = CarPost.find(params[:id])
    @carpost.destroy
      redirect_to car_posts_path
  end

  private
  def car_post_params
    params.require(:car_post).permit(:title, :message, :user_id, :parts_genre_id, :comment_id, :car_image)
  end
end
