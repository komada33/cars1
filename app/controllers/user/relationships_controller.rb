class User::RelationshipsController < ApplicationController

  def create
    current_user.follow(params[:user_id])
    redirect_to request.referer
  end

  def destroy
    current_user.unfollow(params[:user_id])
    redirect_to request.referer
  end

  def followings
    @user = User.find(params[:user_id])
    @users = @user.followings
      redirect_to new_user_session_path unless user_signed_in?
  end

  def followers
    @user = User.find(params[:user_id])
    @users = @user.followers
      redirect_to new_user_session_path unless user_signed_in?
  end
end
