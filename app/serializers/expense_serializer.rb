class ExpenseSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :period, :start_date, :end_date
  has_one :expensable
end
