class Lead < ApplicationRecord
  def self.to_csv
    attributes = %w{gg_id place_id name geometry address website}

    CSV.generate(headers: true) do |csv|
      csv << attributes

      all.each do |result|
        csv << attributes.map{ |attr| result.send(attr) }
      end
    end
  end
end
