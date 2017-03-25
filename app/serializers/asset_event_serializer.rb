class AssetEventSerializer < ActiveModel::Serializer
  attributes :id, :count, :date
  has_one :asset
end
