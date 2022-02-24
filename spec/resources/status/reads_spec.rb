require "rails_helper"

RSpec.describe StatusResource, type: :resource do
  describe "serialization" do
    let!(:status) { create(:status) }

    it "works" do
      render
      data = jsonapi_data[0]
      expect(data.id).to eq(status.id)
      expect(data.jsonapi_type).to eq("statuses")
    end
  end

  describe "filtering" do
    let!(:status1) { create(:status) }
    let!(:status2) { create(:status) }

    context "by id" do
      before do
        params[:filter] = { id: { eq: status2.id } }
      end

      it "works" do
        render
        expect(d.map(&:id)).to eq([status2.id])
      end
    end
  end

  describe "sorting" do
    describe "by id" do
      let!(:status1) { create(:status) }
      let!(:status2) { create(:status) }

      context "when ascending" do
        before do
          params[:sort] = "id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      status1.id,
                                      status2.id,
                                    ])
        end
      end

      context "when descending" do
        before do
          params[:sort] = "-id"
        end

        it "works" do
          render
          expect(d.map(&:id)).to eq([
                                      status2.id,
                                      status1.id,
                                    ])
        end
      end
    end
  end

  describe "sideloading" do
    # ... your tests ...
  end
end
