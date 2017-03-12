class ProductSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_one :asset
end
