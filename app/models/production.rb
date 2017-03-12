class Production < ApplicationRecord
  belongs_to :product

  validates_presence_of :count, :date
end
