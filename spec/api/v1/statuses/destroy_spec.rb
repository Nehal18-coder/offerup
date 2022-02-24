require 'rails_helper'

RSpec.describe "statuses#destroy", type: :request do
  subject(:make_request) do
    jsonapi_delete "/api/v1/statuses/#{status.id}"
  end

  describe 'basic destroy' do
    let!(:status) { create(:status) }

    it 'updates the resource' do
      expect(StatusResource).to receive(:find).and_call_original
      expect {
        make_request
        expect(response.status).to eq(200), response.body
      }.to change { Status.count }.by(-1)
      expect { status.reload }
        .to raise_error(ActiveRecord::RecordNotFound)
      expect(json).to eq('meta' => {})
    end
  end
end
