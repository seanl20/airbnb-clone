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
end