require "rails_helper"

RSpec.describe "statuses#update", type: :request do
  subject(:make_request) do
    jsonapi_put "/api/v1/statuses/#{status.id}", payload
  end

  describe "basic update" do
    let!(:status) { create(:status) }

    let(:payload) do
      {
        data: {
          id: status.id.to_s,
          type: "statuses",
          attributes: {
            # ... your attrs here
          },
        },
      }
    end

    # Replace 'xit' with 'it' after adding attributes
    xit "updates the resource" do
      expect(StatusResource).to receive(:find).and_call_original
      expect do
        make_request
        expect(response.status).to eq(200), response.body
      end.to change { status.reload.attributes }
    end
  end
end
