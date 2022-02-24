require 'rails_helper'

RSpec.describe StatusResource, type: :resource do
  describe 'creating' do
    let(:payload) do
      {
        data: {
          type: 'statuses',
          attributes: { }
        }
      }
    end

    let(:instance) do
      StatusResource.build(payload)
    end

    it 'works' do
      expect {
        expect(instance.save).to eq(true), instance.errors.full_messages.to_sentence
      }.to change { Status.count }.by(1)
    end
  end

  describe 'updating' do
    let!(:status) { create(:status) }

    let(:payload) do
      {
        data: {
          id: status.id.to_s,
          type: 'statuses',
          attributes: { } # Todo!
        }
      }
    end

    let(:instance) do
      StatusResource.find(payload)
    end

    xit 'works (add some attributes and enable this spec)' do
      expect {
        expect(instance.update_attributes).to eq(true)
      }.to change { status.reload.updated_at }
      # .and change { status.foo }.to('bar') <- example
    end
  end

  describe 'destroying' do
    let!(:status) { create(:status) }

    let(:instance) do
      StatusResource.find(id: status.id)
    end

    it 'works' do
      expect {
        expect(instance.destroy).to eq(true)
      }.to change { Status.count }.by(-1)
    end
  end
end
