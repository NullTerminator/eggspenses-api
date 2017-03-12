class ProductionsController < ApplicationController
  private

  def production_params
    params.permit(:count, :date, :product_id)
  end
end
