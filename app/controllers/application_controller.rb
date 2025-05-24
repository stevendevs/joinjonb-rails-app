class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  include PublicActivity::StoreController #save current_user using gem public_activity
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern



  before_action :set_global_variables, if: :user_signed_in?
  def set_global_variables
    @ransack_courses = Course.ransack(params[:courses_search], search_key: :courses_search) #navbar search
  end



  
end
