class CreateProductions < ActiveRecord::Migration[5.0]
  def change
    create_table :productions do |t|
      t.integer :count
      t.date :date
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
