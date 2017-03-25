class AssetSerializer < ActiveModel::Serializer
  attributes :id, :name
  has_many :products
  has_many :expenses
  has_many :asset_events
end
