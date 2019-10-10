class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :authenticate_user!
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :set_categories

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:sign_up, keys: [:nickname, :profile_image, :first_name, :last_name, :first_name_kana, :last_name_kana, :phone_number])
  end

  def set_categories
    @categories = Category.where(ancestry: nil)
  end
end