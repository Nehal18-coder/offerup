require "rails_helper"

RSpec.describe FurnitureResource, type: :resource do
  describe "creating" do
    let(:payload) do
      {
        data: {
          type: "furnitures",
          attributes: {},
        },
      }
    end

    let(:instance) do
      FurnitureResource.build(payload)
    end

    it "works" do
      expect do
        expect(instance.save).to eq(true),
                                 instance.errors.full_messages.to_sentence
      end.to change { Furniture.count }.by(1)
    end
  end

  describe "updating" do
    let!(:furniture) { create(:furniture) }

    let(:payload) do
      {
        data: {
          id: furniture.id.to_s,
          type: "furnitures",
          attributes: {}, # Todo!
        },
      }
    end

    let(:instance) do
      FurnitureResource.find(payload)
    end

    xit "works (add some attributes and enable this spec)" do
      expect do
        expect(instance.update_attributes).to eq(true)
      end.to change { furniture.reload.updated_at }
      # .and change { furniture.foo }.to('bar') <- example
    end
  end

  describe "destroying" do
    let!(:furniture) { create(:furniture) }

    let(:instance) do
      FurnitureResource.find(id: furniture.id)
    end

    it "works" do
      expect do
        expect(instance.destroy).to eq(true)
      end.to change { Furniture.count }.by(-1)
    end
  end
end
