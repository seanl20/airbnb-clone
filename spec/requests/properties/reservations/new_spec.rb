# frozen_string_literal: true

require "rails_helper"

RSpec.describe "GET /properties/:property_id/reservations/new", type: :request do
  let(:property) { FactoryBot.create(:property) }
  let(:user) { FactoryBot.create(:user) }

  before { sign_in user }

  it "returns a successful response" do
    get new_property_reservation_path(property)

    expect(response).to be_successful
  end
end