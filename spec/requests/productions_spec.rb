require 'rails_helper'

RSpec.describe 'Productions API' do
  let(:product) { FactoryGirl.create :product_with_asset }
  let!(:productions) {
    (1..3).map do |i|
      FactoryGirl.create :production, product: product, count: 12, date: i.days.ago.to_date
    end.reverse
  }

  describe 'GET /productions' do
    context "with no params" do
      before { get productions_path }

      it 'returns productions' do
        expect(json.size).to eq 3
      end
    end

    context 'filtered by product' do
      let(:other_product) { FactoryGirl.create :product_with_asset }
      let!(:other_production) { FactoryGirl.create :production, product: other_product, date: 6.months.ago.to_date }

      before { get productions_path(for_product_id: other_product.id) }

      it 'returns productions for that product' do
        expect(json.size).to eq 1
        expect(json[0]['id']).to eq other_production.id.to_s
      end
    end

    context 'filtered by start date' do
      before { get productions_path(from_date: 2.days.ago.to_date) }

      it 'returns productions from that date' do
        expect(json.size).to eq 2
        ids = json.map { |j| j['id'] }
        expect(ids).not_to include productions.first.id
      end
    end

    context 'filtered by end date' do
      before { get productions_path(to_date: 2.days.ago.to_date) }

      it 'returns productions up to that date' do
        expect(json.size).to eq 2
        ids = json.map { |j| j['id'] }
        expect(ids).not_to include productions.last.id
      end
    end

    context 'filtered by start and end date' do
      before { get productions_path(from_date: 2.days.ago.to_date, to_date: 2.days.ago.to_date) }

      it 'returns productions in that range' do
        expect(json.size).to eq 1
        expect(json[0]['id']).to eq productions[1].id.to_s
      end
    end
  end
end
