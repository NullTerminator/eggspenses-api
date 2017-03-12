class SaleItem < ApplicationRecord
  belongs_to :product
  has_many :expenses, as: :expensable

  validates_presence_of :name, :price
  validates_uniqueness_of :name
end
