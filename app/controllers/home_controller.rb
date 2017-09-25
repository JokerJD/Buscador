class HomeController < ApplicationController
  before_action :authenticate_user!

  def index
    @projects = Project.paginate(:page => params[:page])
  end

  def file_upload
    UploadWorker.perform_async(params[:file_upload])

    redirect_to root_path
  end

end
