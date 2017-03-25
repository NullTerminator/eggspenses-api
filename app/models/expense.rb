class Expense < ApplicationRecord
  belongs_to :expensable, polymorphic: true

  validates_presence_of :name, :price

  scope :from_date, -> (after_date) { where(arel_table[:end_date].gteq after_date).or(where(end_date: nil)) }
  scope :to_date, -> (before_date) { where(arel_table[:start_date].lteq before_date).or(where(start_date: nil)) }
end
