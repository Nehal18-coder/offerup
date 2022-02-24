require "rails_helper"

RSpec.describe "statuses#show", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/statuses/#{status.id}", params: params
  end

  describe "basic fetch" do
    let!(:status) { create(:status) }

    it "works" do
      expect(StatusResource).to receive(:find).and_call_original
      make_request
      expect(response.status).to eq(200)
      expect(d.jsonapi_type).to eq("statuses")
      expect(d.id).to eq(status.id)
    end
  end
end
