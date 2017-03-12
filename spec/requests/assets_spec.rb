require 'rails_helper'

RSpec.describe 'Assets API', type: :request do
  let!(:assets) { create_list(:asset, 5) }
  let(:asset_id) { assets.first.id }

  let(:assets_json) { json['assets'] }

  describe 'GET /assets' do
    before { get '/assets' }

    it 'returns assets' do
      expect(assets_json).not_to be_empty
      expect(assets_json.size).to eq 5
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET /assets/:id' do
    before { get "/assets/#{asset_id}" }

    context 'when the record exists' do
      it 'returns the asset' do
        expect(assets_json).not_to be_empty
        expect(assets_json.first['id']).to eq asset_id
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:asset_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Asset/)
      end
    end
  end

  describe 'POST /assets' do
    let(:valid_attributes) { { name: 'Cows', count: 4 } }

    context 'when the request is valid' do
      before { post '/assets', params: valid_attributes }

      it 'creates an asset' do
        expect(assets_json.first['name']).to eq 'Cows'
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/assets', params: { count: 4} }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns an error message' do
        expect(response.body).to match(/Validation failed: Name can't be blank/)
      end
    end
  end

  describe 'PUT /assets/:id' do
    let(:valid_attributes) { { name: 'Cow', count: 4 } }

    context 'when record exists' do
      before { put "/assets/#{asset_id}", params: valid_attributes }

      it 'updates the asset' do
        expect(assets_json.first['name']).to eq 'Cow'
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end
  end

  describe 'DELETE /assets/:id' do
    before { delete "/assets/#{asset_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end
end
