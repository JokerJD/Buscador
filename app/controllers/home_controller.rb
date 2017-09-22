class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = Project.paginate(:page => params[:page])

  end
  def locations
    @locations = Location.paginate(:page => params[:page])
  end

  def new
    project = Project.new
    project.name = 'test'
    project.save

    redirect_to root_path
  end
end
