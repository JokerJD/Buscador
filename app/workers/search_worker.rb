class SearchWorker
  include Sidekiq::Worker
  require 'csv'
  require 'open-uri'

  def perform(project)
    @locations = Location.find_by(project_id: project.id)
    @api_key = 'AIzaSyAaGTZYJjsDPGNL7zreKxiAoOAs2uLg2Zg'

    @locations.each do |location|
      @client = GooglePlaces::Client.new(API_KEY)
      @results = @client.spots(location.lat, location.lng, :types => 'restaurant',
                    :radius => 10000, multipage: true)
      SaveWorker.perform(location.id, @results)
      sleep 0.5
    end
  end

end
