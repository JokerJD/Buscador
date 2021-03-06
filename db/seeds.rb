require 'csv'

p = Project.new
p.name = 'test1'
p.save

csv_text = File.read(Rails.root.join('lib', 'seeds', 'Test1.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
  t = Location.new
  t.project = p
  t.zip_code = row['zip_code']
  t.lat = row['latitude']
  t.lng = row['longitude']
  t.city = row['city']
  t.state = row['state']
  t.save
  puts "#{t.zip_code} saved"
end

puts "There are now #{Location.count} rows in the Locations table"

