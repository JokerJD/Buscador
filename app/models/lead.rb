class Lead < ApplicationRecord
  belongs_to :location

  def self.to_csv
    attributes = %w{gg_id place_id name geometry address website}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |lead|
        csv << attributes.map{ |attr| lead.send(attr) }
      end
    end
  end
end
