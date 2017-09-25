class SearchController < ApplicationController
  before_action :authenticate_user!
  OpenSSL::SSL::VERIFY_PEER = OpenSSL::SSL::VERIFY_NONE

  def new
    @target = Location.find(params[:q])
    @response = helpers.get_spots(@target.lat, @target.lng)

    helpers.save_db(@response)
    redirect_to search_show_url
  end

  def search
    @project = Project.find(params[:id])
    SearchWorker.perform_async(@project)

    redirect_to search_show_url
  end

  def show
    @leads = Lead.paginate(:page => params[:page])

    respond_to do |format|
      format.html
      format.csv { send_data @leads.to_csv, filename: "Leads-#{Date.today}.csv" }
    end
  end

end
