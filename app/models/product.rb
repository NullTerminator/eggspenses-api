class Product < ApplicationRecord
  belongs_to :asset

  validates_presence_of :name, :asset_id
  validates_uniqueness_of :name
end
