class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = Project.paginate(:page => params[:page])
  end

  def file_upload
    project = Project.new
    project.name = params[:my_file].original_filename
    UploadWorker.perform_async(params[:my_file])

    redirect_to root_url
  end

end
