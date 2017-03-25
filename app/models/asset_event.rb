class AssetEvent < ApplicationRecord
  belongs_to :asset

  validates_presence_of :count, :date
  validates_uniqueness_of :date, scope: :asset_id

  scope :from_date, -> (after_date) { where(arel_table[:date].gteq after_date) }
  scope :to_date, -> (before_date) { where(arel_table[:date].lteq before_date) }
end
