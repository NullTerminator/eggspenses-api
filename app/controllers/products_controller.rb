class ProductsController < ApplicationController
  private

  def product_params
    params.permit(:name, :asset_id)
  end
end
