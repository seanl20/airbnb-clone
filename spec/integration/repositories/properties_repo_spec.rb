require "rails_helper"

RSpec.describe Repositories::PropertiesRepo do
  describe "#get" do
    subject(:get) { described_class.new.get(id: property_id) }

    context "user exists" do
      let!(:property) { FactoryBot.create(:property) }
      let(:property_id) { property.id }

      it "is successful" do
        expect(get).to eq(property)
      end
    end

    context "user does not exists" do
      let(:property_id) { "test" }

      it "is not found" do
        expect{ get }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end