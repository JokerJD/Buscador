class SearchController < ApplicationController
  before_action :authenticate_user!
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

  def search
    @project = Project.find_by_id(params[:project_id])
    puts @project
    SearchWorker.perform_async(@project)

    redirect_to root_url
  end
end
