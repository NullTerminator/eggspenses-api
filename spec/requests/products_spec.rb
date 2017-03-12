require 'rails_helper'

RSpec.describe 'Products API' do
  let!(:products) { create_list :product, 10 }
  let(:product_id) { products.first.id }

  describe 'GET /assets/:asset_id/' do
  end
end
