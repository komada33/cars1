class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_search

  def set_search
    @search = CarPost.ransack(params[:q])
    @search_carposts = @search.result.page(params[:page]).per(5)
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :plofile_image, :car_name, :maker_genre_id])
  end
end
