require "rails_helper"

RSpec.describe Repositories::UserRepo do
  describe "#get" do
    subject(:get) { described_class.new.get(id: user_id) }

    context "user exists" do
      let!(:user) { FactoryBot.create(:user) }
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

  describe "#get_by_email" do
  subject(:get_by_email) { described_class.new.get_by_email(email: email) }

  context "user exists" do
    let!(:user) { FactoryBot.create(:user, email: "test@example.com") }
    let(:email) { "test@example.com" }

    it "is successful" do
      expect(get_by_email).to eq(user)
    end
  end

  context "user does not exists" do
    let(:email) { "test@example.com" }

    it "is not found" do
      expect{ get_by_email }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end

  end
end