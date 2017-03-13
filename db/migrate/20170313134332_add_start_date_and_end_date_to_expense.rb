class AddStartDateAndEndDateToExpense < ActiveRecord::Migration[5.0]
  def change
    add_column :expenses, :start_date, :date
    add_column :expenses, :end_date, :date
  end
end
