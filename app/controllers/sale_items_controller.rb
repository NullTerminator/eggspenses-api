class SaleItemsController < ApplicationController
  private

  def sale_item_params
    params.permit(:name, :price, :product_count, :product_id)
  end
end
