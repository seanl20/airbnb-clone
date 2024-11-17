# frozen_string_literal: true

require "rails_helper"

RSpec.describe "GET /host/payments/", type: :request do
  let(:user) { FactoryBot.create(:user, :host) }
  let(:property) { FactoryBot.create(:property, user:) }
  let(:reservations) { FactoryBot.create_list(:reservation, 3, property:) }
  let(:payments) do
    reservations.map do |reservation|
      FactoryBot.create(:payment, reservation:)
    end
  end

  before { sign_in user }

  it "returns a successful response" do
    get payments_path

    expect(response).to be_successful
  end
end