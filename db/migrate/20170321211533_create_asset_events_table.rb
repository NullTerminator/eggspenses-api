class CreateAssetEventsTable < ActiveRecord::Migration[5.0]
  def change
    create_table :asset_events do |t|
      t.integer :count
      t.date :date
      t.references :asset, foreign_key: true

      t.timestamps
    end

    remove_column :assets, :count, :integer
  end
end
