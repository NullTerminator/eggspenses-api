class RenameExpenseAmountToPrice < ActiveRecord::Migration[5.0]
  def change
    change_table :expenses do |t|
      t.rename :amount, :price
    end
  end
end
