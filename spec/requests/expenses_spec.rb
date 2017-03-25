require 'rails_helper'

RSpec.describe 'Expenses API' do
  describe 'GET /expenses' do
    let(:asset) { FactoryGirl.create :asset }
    let!(:expense) { FactoryGirl.create :expense, expensable: asset }
    let!(:old_with_dates) { FactoryGirl.create :expense, expensable: asset, start_date: 8.weeks.ago.to_date, end_date: 7.weeks.ago.to_date }
    let!(:middle_with_dates) { FactoryGirl.create :expense, expensable: asset, start_date: 5.weeks.ago.to_date, end_date: 4.weeks.ago.to_date }
    let!(:new_with_dates) { FactoryGirl.create :expense, expensable: asset, start_date: 2.weeks.ago.to_date, end_date: 1.weeks.ago.to_date }

    context 'with no params' do
      before { get expenses_path }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns expenses' do
        expect(json.size).to eq 4
      end
    end

    context 'filtered by from_date' do
      before { get expenses_path(from_date: 3.weeks.ago.to_date) }

      it 'returns expenses lacking a date or starting after the date' do
        expect(json.size).to eq 2
        ids = json.map { |j| j['id'] }
        expect(ids).to include expense.id.to_s, new_with_dates.id.to_s
      end
    end

    context 'filtered by to_date' do
      before { get expenses_path(to_date: 6.weeks.ago.to_date) }

      it 'returns expenses lacking a date or starting after the date' do
        expect(json.size).to eq 2
        ids = json.map { |j| j['id'] }
        expect(ids).to include expense.id.to_s, old_with_dates.id.to_s
      end
    end

    context 'filtered by to and from date' do
      before { get expenses_path(from_date: 6.weeks.ago.to_date, to_date: 3.weeks.ago.to_date) }

      it 'returns expenses lacking a date or starting after the date' do
        expect(json.size).to eq 2
        ids = json.map { |j| j['id'] }
        expect(ids).to include expense.id.to_s, middle_with_dates.id.to_s
      end
    end
  end
end
