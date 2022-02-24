require 'rails_helper'

RSpec.describe "statuses#create", type: :request do
  subject(:make_request) do
    jsonapi_post "/api/v1/statuses", payload
  end

  describe 'basic create' do
    let(:params) do
      {
        # ... your attrs here
      }
    end
    let(:payload) do
      {
        data: {
          type: 'statuses',
          attributes: params
        }
      }
    end

    it 'works' do
      expect(StatusResource).to receive(:build).and_call_original
      expect {
        make_request
        expect(response.status).to eq(201), response.body
      }.to change { Status.count }.by(1)
    end
  end
end
