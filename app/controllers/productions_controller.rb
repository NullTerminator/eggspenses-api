class ProductionsController < ApplicationController
  private

  def production_params
    params.permit(:count, :date, :product_id)
  end

  def filter_params
    [:from_date, :to_date]
  end
end
