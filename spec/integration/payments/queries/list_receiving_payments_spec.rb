require "rails_helper"

RSpec.describe Payments::Queries::ListReceivingPayments, "#call", :db do
  let(:query) { described_class.new }

  let!(:user_1) { FactoryBot.create(:user) }
  let!(:user_2) { FactoryBot.create(:user) }
  let!(:property) { FactoryBot.create(:property, user: user_1) }
  let!(:reservation) { FactoryBot.create(:reservation, user: user_1, property:) }
  let!(:payment) { FactoryBot.create(:payment, reservation:) }

  subject(:call) do
    query.call(user_id:)
  end

  context "user exists" do

    context "when user have payment" do
      let(:user_id) { user_1.id }

      it "returns payment" do
        expect(call).to match_unordered_elements(payment)
      end
    end

    context "when user does not have payment" do
      let(:user_id) { user_2.id }

      it "returns empty" do
        expect(call).to be_empty
      end
    end
  end

  context "user does not exists" do
    let(:user_id) { "test" }

    it "returns not found error" do
      expect{ call }.to raise_error(ActiveRecord::RecordNotFound)
    end
  end
end