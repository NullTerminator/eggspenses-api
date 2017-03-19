class Production < ApplicationRecord
  belongs_to :product

  validates_presence_of :count, :date
  validates_uniqueness_of :date, scope: :product_id

  scope :from_date, -> (after_date) { where(arel_table[:date].gteq after_date) }
  scope :to_date, -> (before_date) { where(arel_table[:date].lteq before_date) }
  scope :for_product_id, -> (product_id) { where(product_id: product_id) }
end
