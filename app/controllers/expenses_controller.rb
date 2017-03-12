class ExpensesController < ApplicationController
  private

  def expense_params
    params.permit(:name, :price, :period, :expensable_type, :expensable_id)
  end
end
