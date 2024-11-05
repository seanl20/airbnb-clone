require "rails_helper"

RSpec.describe Repositories::ReservationRepo do
  describe "#create" do
    subject(:create) { described_class.new.create(attrs:) }

    context "user and property exists" do
      let!(:user) { FactoryBot.create(:user) }
      let!(:property) { FactoryBot.create(:property) }

      let!(:attrs) do
        {
          user_id: user.id,
          property_id: property.id,
          checkin_date: DateTime.current,
          checkout_date: DateTime.current + 1.day
        }
      end

      it "returns successful" do
        puts user
        expect{ create }.to change { Reservation.count }.by(1)
      end
    end

    context "user and property does not exists" do
      let!(:attrs) do
        {
          user_id: "test user",
          property_id: "test property",
          checkin_date: DateTime.current,
          checkout_date: DateTime.current + 1.day
        }
      end

      it "returns record invalid error" do
        expect{ create }.to raise_error(ActiveRecord::RecordInvalid)
      end
    end
  end

end