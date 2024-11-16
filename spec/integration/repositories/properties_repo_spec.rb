require "rails_helper"

RSpec.describe Repositories::PropertiesRepo do
  describe "#get" do
    subject(:get) { described_class.new.get(id: property_id) }

    context "property exists" do
      let!(:property) { FactoryBot.create(:property) }
      let(:property_id) { property.id }

      it "is successful" do
        expect(get).to eq(property)
      end
    end

    context "property does not exists" do
      let(:property_id) { "test" }

      it "is not found" do
        expect{ get }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe "#get_by_user" do
    subject(:get_by_user) { described_class.new.get_by_user(user:) }

    let!(:user_1) { FactoryBot.create(:user) }
    let!(:user_2) { FactoryBot.create(:user) }
    let!(:user_3) { FactoryBot.create(:user) }

    let!(:property_1) { FactoryBot.create(:property, user: user_1) }
    let!(:property_2) { FactoryBot.create(:property, user: user_1) }
    let!(:property_3) { FactoryBot.create(:property, user: user_2) }

    context "user have properties" do
      let!(:user) {user_1}

      it "returns user's properties" do
        expect(get_by_user).to match_unordered_elements(property_1, property_2)
        expect(get_by_user).to_not include(property_3)
      end
    end

    context "user does not have properties" do
      let!(:user) {user_3}

      it "returns user's properties" do
        expect(get_by_user).to be_empty
      end
    end
  end


  describe "#create" do
    subject(:create) { described_class.new.create(attrs:) }

    let!(:user) { FactoryBot.create(:user) }

    context "when valid attrs are passed" do
      let(:attrs) do 
        {
          name: "test",
          headline: "headline",
          description: "description",
          address_1: "address",
          city: "city",
          state: "state",
          country_code: "US",
          user:
        } 
      end

      it "create property" do
        expect{ create }.to change { Property.count }.by(1)
      end
    end

    context "when invalid attrs are passed" do
      let(:attrs) do 
        {
          name: "test",
          user:
        } 
      end

      it "does not create property" do
        expect{ create }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end
end