class CreateDatasetSources < ActiveRecord::Migration[7.1]
  def change
    create_table :dataset_sources do |t|
      t.string :name
      t.string :url
      t.integer :offset, default: 0

      t.timestamps
    end
  end
end
