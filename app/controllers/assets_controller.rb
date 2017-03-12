class AssetsController < ApplicationController
  private

  def asset_params
    params.permit(:name, :count)
  end
end
