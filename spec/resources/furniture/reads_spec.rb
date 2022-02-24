require 'rails_helper'

RSpec.describe FurnitureResource, type: :resource do
  describe 'serialization' do
    let!(:furniture) { create(:furniture) }

    it 'works' do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(furniture.id)
      expect(data.jsonapi_type).to eq('furnitures')
    end
  end

  describe 'filtering' do
    let!(:furniture1) { create(:furniture) }
    let!(:furniture2) { create(:furniture) }

    context 'by id' do
      before do
        params[:filter] = { id: { eq: furniture2.id } }
      end

      it 'works' do
        render
        expect(d.map(&:id)).to eq([furniture2.id])
      end
    end
  end

  describe 'sorting' do
    describe 'by id' do
      let!(:furniture1) { create(:furniture) }
      let!(:furniture2) { create(:furniture) }

      context 'when ascending' do
        before do
          params[:sort] = 'id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            furniture1.id,
            furniture2.id
          ])
        end
      end

      context 'when descending' do
        before do
          params[:sort] = '-id'
        end

        it 'works' do
          render
          expect(d.map(&:id)).to eq([
            furniture2.id,
            furniture1.id
          ])
        end
      end
    end
  end

  describe 'sideloading' do
    # ... your tests ...
  end
end
