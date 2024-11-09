require "rails_helper"

RSpec.describe Repositories::ProfileRepo do
  describe "#get" do
    subject(:get) { described_class.new.get(id: profile_id) }

    context "profile exists" do
      let!(:profile) { FactoryBot.create(:profile) }
      let(:profile_id) { profile.id }

      it "is successful" do
        expect(get).to eq(profile)
      end
    end

    context "profile does not exists" do
      let(:profile_id) { "test" }

      it "is not found" do
        expect{ get }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end

  describe "#update" do
    subject(:update) { described_class.new.update(id: profile_id, attrs:) }

    context "profile exists" do
      let!(:profile) { FactoryBot.create(:profile) }
      let(:profile_id) { profile.id }
      let(:attrs) do
        {
          first_name: "Test",
          last_name: "Name",
          address_1: "Address_1",
          address_2: "Address_2",
          city: "City",
          state: "State",
          zip_code: "Zip code",
          country_code: "US"
        }
      end

      it "is successful" do
        expect(update).to be true

        reloaded_profile = profile.reload
        expect(reloaded_profile.first_name).to eq("Test")
        expect(reloaded_profile.last_name).to eq("Name")
        expect(reloaded_profile.address_1).to eq("Address_1")
        expect(reloaded_profile.address_2).to eq("Address_2")
        expect(reloaded_profile.city).to eq("City")
        expect(reloaded_profile.state).to eq("State")
        expect(reloaded_profile.zip_code).to eq("Zip code")
        expect(reloaded_profile.country_code).to eq("US")
      end
    end

    context "profile does not exists" do
      let(:profile_id) { "test" }
      let(:attrs) do
        {}
      end


      it "is not found" do
        expect{ update }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end