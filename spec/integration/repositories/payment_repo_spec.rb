require "rails_helper"

RSpec.describe Repositories::PaymentRepo do
  describe "#create" do
    subject(:create) { described_class.new.create(attrs:, monetize_attrs:) }

    context "reservation exists" do
      let!(:reservation) { FactoryBot.create(:reservation) }

      let!(:attrs) do
        {
          reservation_id: reservation.id
        }
      end

      let!(:monetize_attrs) do
        {}
      end

      it "returns successful" do
        expect{ create }.to change { Payment.count }.by(1)
      end
    end

    context "user and property does not exists" do
      let!(:attrs) do
        {
          reservation_id: "test reservation"
        }
      end

      let!(:monetize_attrs) do
        {}
      end

      it "returns record invalid error" do
        expect{ create }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end

end