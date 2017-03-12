class CreateSaleItems < ActiveRecord::Migration[5.0]
  def change
    create_table :sale_items do |t|
      t.string :name
      t.float :price
      t.integer :product_count
      t.references :product, foreign_key: true

      t.timestamps
    end
  end
end
