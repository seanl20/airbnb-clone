# frozen_string_literal: true

require "rails_helper"

RSpec.describe "POST /reservation_payments", type: :request do
  let!(:user) { FactoryBot.create(:user, stripe_id: SecureRandom.uuid) }
  let!(:property) { FactoryBot.create(:property) }

  let!(:payment_params) do
    {
      stripeToken: SecureRandom.uuid,
      property_id: property.id,
      user_id: user.id,
      checkin_date: "11/10/2024",
      checkout_date: "12/10/2024",
      subtotal: "100",
      cleaning_fee: "50",
      service_fee: "12.24",
      total: "162.24"
    }
  end

  before do
    sign_in user

    allow(Stripe::Customer).to receive(:retrieve).and_return(double(id: "user_stripe_id"))
    allow(Stripe::Customer).to receive(:create_source).and_return(double(id: "card_id"))
    allow(Stripe::Charge).to receive(:create).and_return(double(id: "charge_id"))
  end

  it "Succeeds in creating a reservation" do
    expect {
      post reservation_payments_path, params: payment_params
    }.to change { Reservation.count }.by(1)
  end

  it "Succeeds in creating a payment" do
    expect {
      post reservation_payments_path, params: payment_params
    }.to change { Payment.count }.by(1)
  end
end