require "rails_helper"

RSpec.describe "statuses#index", type: :request do
  let(:params) { {} }

  subject(:make_request) do
    jsonapi_get "/api/v1/statuses", params: params
  end

  describe "basic fetch" do
    let!(:status1) { create(:status) }
    let!(:status2) { create(:status) }

    it "works" do
      expect(StatusResource).to receive(:all).and_call_original
      make_request
      expect(response.status).to eq(200), response.body
      expect(d.map(&:jsonapi_type).uniq).to match_array(["statuses"])
      expect(d.map(&:id)).to match_array([status1.id, status2.id])
    end
  end
end
