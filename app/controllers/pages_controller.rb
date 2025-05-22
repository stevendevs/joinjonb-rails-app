class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index]

  def index
    @courses = Course.limit(3)
    @latest_courses = Course.order(created_at: :desc).limit(3)
  end
end
