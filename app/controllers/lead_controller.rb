class LeadController < ApplicationController
  def show
    @leads = Lead.paginate(:page => params[:page])

    respond_to do |format|
      format.html
      format.csv { send_data @leads.to_csv, filename: "Leads-#{Date.today}.csv" }
    end
  end
end
