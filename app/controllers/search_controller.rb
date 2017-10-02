class SearchController < ApplicationController
  before_action :authenticate_user!
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

  def search
    @project = Project.first
    puts @project
    SearchWorker.perform_async(@project.id)

    redirect_to root_url
  end
end
