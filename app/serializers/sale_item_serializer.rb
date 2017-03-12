class SaleItemSerializer < ActiveModel::Serializer
  attributes :id, :name, :price, :product_count
  has_one :product
  has_many :expenses
end
