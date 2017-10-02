class SearchWorker
  include Sidekiq::Worker
  require 'csv'
  require 'open-uri'

  def perform(project)
    @project = Project.find(project)
    @locations = Location.where(project: @project)

    @api_key = 'AIzaSyAaGTZYJjsDPGNL7zreKxiAoOAs2uLg2Zg'
    @locations.each do |location|
      @client = GooglePlaces::Client.new(@api_key)
      @results = @client.spots(location.lat, location.lng, :types => 'restaurant',
                    :radius => 10000, multipage: true)
      #SaveWorker.perform(location.id, @results)

      print @results
      @results.results.each do |d|
        if Lead.find_by(gg_id: d.id)
          next
        else
          Lead.create(
              location_id: location.id,
              gg_id: d.id,
              place_id: d.place_id,
              name: d.name,
              #geometry: d.geometry,
              address: d.vicinity,
              website: d.website
          )
          puts "#{Lead.id} saved"
        end
      end

      sleep 0.5
    end
  end

end
