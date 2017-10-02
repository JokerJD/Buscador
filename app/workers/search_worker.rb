class SearchWorker
  include Sidekiq::Worker
  require 'csv'
  require 'open-uri'

  def perform(project)
    @project = Project.find(project)
    @locations = Location.where(project: @project)

    @locations.each do |location|
      @client = GooglePlaces::Client.new('AIzaSyAaGTZYJjsDPGNL7zreKxiAoOAs2uLg2Zg')
      @results = @client.spots(location.lat, location.lng, :types => 'restaurant',:radius => 10000, multipage: true)

      q = Query.new()
      q.project = @project
      q.result_count = @results.count
      leads_before = Lead.count

      @results.each do |d|
        if d.place_id != nil
          unless Lead.find_by(place_id: d.place_id)
            Lead.create(
                location_id: location.id,
                place_id: d.place_id,
                name: d.name,
                address: d.vicinity,
                website: d.website
            )
          end
        end
      end

      q.leads_generated_count = Lead.count - leads_before
      q.save!
    end
  end

end
