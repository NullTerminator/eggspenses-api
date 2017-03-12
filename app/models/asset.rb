class Asset < ApplicationRecord
  has_many :products
  has_many :expenses, as: :expensable

  validates_presence_of :name, :count
  validates_uniqueness_of :name
end
