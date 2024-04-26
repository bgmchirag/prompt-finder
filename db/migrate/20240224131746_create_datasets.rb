class CreateDatasets < ActiveRecord::Migration[7.1]
  def change
    create_table :datasets do |t|
      t.text :prompt

      t.timestamps
    end
  end
end
