require "rails_helper"

RSpec.describe "furnitures#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/furnitures/#{furniture.id}", params: params
  end

  describe "basic fetch" do
    let!(:furniture) { create(:furniture) }

    it "works" do
      expect(FurnitureResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("furnitures")
      expect(d.id).to eq(furniture.id)
    end
  end
end
