require "rails_helper"

RSpec.describe Furniture, type: :model do
  describe "Direct Associations" do
    it { should belong_to(:status) }

    it { should belong_to(:user) }
  end

  describe "InDirect Associations" do
  end

  describe "Validations" do
  end
end
