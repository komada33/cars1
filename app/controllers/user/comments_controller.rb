class User::CommentsController < ApplicationController

  def create
    @carpost = CarPost.find(params[:car_post_id])
    @comment = @carpost.comments.new(comment_params)
    @comment.user_id = current_user.id
    if @comment.save
      redirect_back(fallback_location: root_path)
    else
      redirect_back(fallback_location: root_path)
    end
  end

  private
  def comment_params
    params.require(:comment).permit(:post_comment, :car_post_id)
  end
end
