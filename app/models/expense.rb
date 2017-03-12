class Expense < ApplicationRecord
  belongs_to :expensable, polymorphic: true

  validates_presence_of :name, :price
end
