class SaveWorker
  include Sidekiq::Worker

  def perform(id, data)
    data.each do |d|
      if Lead.find_by(gg_id: d.id)
        next
      else
        Lead.create(
            location_id: id,
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
