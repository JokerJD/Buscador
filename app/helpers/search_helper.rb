module SearchHelper
  API_KEY = "AIzaSyAaGTZYJjsDPGNL7zreKxiAoOAs2uLg2Zg"

  def get_spots (lat, lng)
    @client = GooglePlaces::Client.new(API_KEY)
    @client.spots(lat, lng, :types => 'restaurant',
                  :radius => 10000, multipage: true)
  end

  def save_db (data)
    data.each do |d|
      if Lead.find_by(gg_id: d.id)
        next
      else
        Lead.create(
            gg_id: d.id,
            place_id: d.place_id,
            name: d.name,
            #geometry: d.geometry,
            address: d.vicinity,
            website: d.website
        )
      end
    end
  end
end
