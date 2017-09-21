class LeadController < ApplicationController
  def index
    @leads = Lead.all

    respond_to do |format|
      format.html
      format.csv { send_data @leads.to_csv, filename: "Leads-#{Date.today}.csv" }
    end
end
