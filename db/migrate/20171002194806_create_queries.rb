class CreateQueries < ActiveRecord::Migration[5.1]
  def change
    create_table :queries do |t|
      t.references :project, foreign_key: true
      t.integer :result_count
      t.integer :leads_generated_count

      t.timestamps
    end
  end
end
