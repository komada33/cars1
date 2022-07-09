class User::HomesController < ApplicationController
  def top
    @carposts = CarPost.all.order(created_at: :desc)
  end
end
