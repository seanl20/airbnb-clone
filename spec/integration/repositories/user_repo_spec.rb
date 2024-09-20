require "rails_helper"

RSpec.describe Repositories::UserRepo do
  describe "#get" do
    subject(:get) { described_class.new.get(id: user_id) }

    context "user exists" do
      let(:user) { FactoryBot.create(:user) }
      let(:user_id) { user.id }

      it "is successful" do
        expect(get).to eq(user)
      end
    end

    context "user does not exists" do
      let(:user_id) { "test" }

      it "is not found" do
        expect{ get }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end