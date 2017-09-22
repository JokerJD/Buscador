class CreateLocations < ActiveRecord::Migration[5.1]
  def change
    create_table :locations do |t|
      t.string :zip_code
      t.string :lat
      t.string :lng
      t.string :city
      t.string :state
      t.string :name
      t.string :address
      t.string :project_id

      t.timestamps
    end
  end
end
