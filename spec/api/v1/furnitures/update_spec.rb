require "rails_helper"

RSpec.describe "furnitures#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/furnitures/#{furniture.id}", payload
  end

  describe "basic update" do
    let!(:furniture) { create(:furniture) }

    let(:payload) do
      {
        data: {
          id: furniture.id.to_s,
          type: "furnitures",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(FurnitureResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { furniture.reload.attributes }
    end
  end
end
