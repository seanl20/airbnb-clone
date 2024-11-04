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

  describe "#update" do
    subject(:update) { described_class.new.update(id:, attrs:) }

    context "user exists" do
      let!(:user) { FactoryBot.create(:user, email: "test@example.com") }
      let(:id) { user.id }

      context "when valid attrs have been passed" do
        let(:attrs) do 
          {
            stripe_id: "test"
          } 
        end

        it "is successful" do
          update

          expect(user.reload.stripe_id).to eq("test")
        end
      end

      context "when invalid attrs have been passed" do
        let(:attrs) do 
          {
            stripe: "test"
          } 
        end

        it "returns unknown attribute error" do
          expect{ update }.to raise_error(ActiveModel::UnknownAttributeError)
        end
      end
    end

    context "user does not exists" do
      let(:id) { "test" }
      let(:attrs) { nil }

      it "returns not found error" do
        expect{ update }.to raise_error(ActiveRecord::RecordNotFound)
      end
    end
  end
end