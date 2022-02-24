require 'rails_helper'

RSpec.describe "furnitures#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/furnitures", params: params
  end

  describe 'basic fetch' do
    let!(:furniture1) { create(:furniture) }
    let!(:furniture2) { create(:furniture) }

    it 'works' do
      expect(FurnitureResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(['furnitures'])
      expect(d.map(&:id)).to match_array([furniture1.id, furniture2.id])
    end
  end
end
