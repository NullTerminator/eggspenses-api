require 'rails_helper'

RSpec.describe 'Asset Events API' do
  describe 'GET /asset_events' do
    let(:chickens) { FactoryGirl.create(:asset, name: 'Chickens') }
    let(:ducks) { FactoryGirl.create(:asset, name: 'Ducks') }

    let(:chickens_today) { FactoryGirl.create(:asset_event, date: Date.today, asset: chickens) }
    let(:chickens_days_ago) { FactoryGirl.create(:asset_event, date: 2.days.ago, asset: chickens) }
    let(:ducks_today) { FactoryGirl.create(:asset_event, date: Date.today, asset: ducks) }
    let(:ducks_days_ago) { FactoryGirl.create(:asset_event, date: 2.days.ago, asset: ducks) }

    let!(:events) { [chickens_today, chickens_days_ago, ducks_today, ducks_days_ago] }

    context 'with no params' do
      before { get asset_events_path }

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end

      it 'returns asset events' do
        expect(json.size).to eq 4
      end
    end

    context 'filtered by from_date' do
      context 'when from_date is before all events' do
        before { get asset_events_path(from_date: 3.days.ago.to_date) }

        it 'returns all events' do
          expect(json.size).to eq 4
        end
      end

      context 'when from_date matches an event' do
        before { get asset_events_path(from_date: 2.days.ago.to_date) }

        it 'returns those events' do
          expect(json.size).to eq 4
          ids = json.map { |j| j['id'] }
          expect(ids).to include *events.map { |e| e.id.to_s }
        end
      end

      context 'when from_date is between events' do
        before { get asset_events_path(from_date: 1.days.ago.to_date) }

        it 'includes previous event' do
          expect(json.size).to eq 4
          ids = json.map { |j| j['id'] }
          expect(ids).to include *events.map { |e| e.id.to_s }
        end
      end

      context 'when from_date is after all events' do
        before { get asset_events_path(from_date: 2.days.from_now.to_date) }

        it 'returns the most recent events for each asset' do
          expect(json.size).to eq 2
          ids = json.map { |j| j['id'] }
          expect(ids).to include chickens_today.id.to_s, ducks_today.id.to_s
        end
      end
    end

    context 'filtered by to_date' do
      context 'when to_date is before all events' do
        before { get asset_events_path(to_date: 3.days.ago.to_date) }

        it 'returns no events' do
          expect(json.size).to eq 0
        end
      end

      context 'when to_date is between events' do
        before { get asset_events_path(to_date: 1.days.ago.to_date) }

        it 'includes events before date' do
          expect(json.size).to eq 2
          ids = json.map { |j| j['id'] }
          expect(ids).to include chickens_days_ago.id.to_s, ducks_days_ago.id.to_s
        end
      end

      context 'when to_date is after all events' do
        before { get asset_events_path(to_date: 2.days.from_now.to_date) }

        it 'returns all events' do
          expect(json.size).to eq 4
        end
      end
    end
  end
end
