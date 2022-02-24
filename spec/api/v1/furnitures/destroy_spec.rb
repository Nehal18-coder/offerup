require "rails_helper"

RSpec.describe "furnitures#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/furnitures/#{furniture.id}"
  end

  describe "basic destroy" do
    let!(:furniture) { create(:furniture) }

    it "updates the resource" do
      expect(FurnitureResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { Furniture.count }.by(-1)
      expect { furniture.reload }.
        to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq("meta" => {})
    end
  end
end
