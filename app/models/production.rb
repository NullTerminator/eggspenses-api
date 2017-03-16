class Production < ApplicationRecord
  belongs_to :product

  validates_presence_of :count, :date

  scope :from_date, -> (after_date) { where(arel_table[:date].gteq after_date) }
  scope :to_date, -> (before_date) { where(arel_table[:date].lteq before_date) }
end
