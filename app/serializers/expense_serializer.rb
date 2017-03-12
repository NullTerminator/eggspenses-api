class ExpenseSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :period
  has_one :expensable
end
