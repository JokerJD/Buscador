class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @locations = Location.paginate(:page => params[:page])
  end
end
