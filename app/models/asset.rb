class Asset < ApplicationRecord
  has_many :asset_events
  has_many :products
  has_many :expenses, as: :expensable

  validates_presence_of :name
  validates_uniqueness_of :name
end
