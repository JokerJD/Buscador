class CreateLeads < ActiveRecord::Migration[5.1]
  def change
    create_table :leads do |t|
      t.string :gg_id
      t.string :place_id
      t.string :name
      t.string :geometry
      t.string :address
      t.string :website
      t.string :location_id
      t.string :city
      t.string :state

      t.timestamps
    end
    add_index :leads, :gg_id
    add_index :leads, :location_id
  end
end
