class AssetSerializer < ActiveModel::Serializer
  attributes :id, :name, :count
  has_many :products
  has_many :expenses
end
