class ProductionSerializer < ActiveModel::Serializer
  attributes :id, :count, :date
  has_one :product
end
