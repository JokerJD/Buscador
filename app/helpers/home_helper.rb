module HomeHelper
  require 'open-uri'

  def open_scv(url)
    CSV.parse(open(url).read, headers: true) do |r|
      r = r.to_hash
      unless r.slice('city', 'state', 'lat','lng').values.any?(&:blank?)
        #Only process if the column has all the valid data
        r = r.slice('city', 'state', 'lat','lng','zip_code','name','address','website','type')
        #Use only the expected and valid columns
      end
    end
  end

end
