# frozen_string_literal: true

require "rails_helper"

RSpec.describe "GET /payments/:id", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:payments) { FactoryBot.create(:payment, 3, user:) }

  before { sign_in user }

  it "returns a successful response" do
    get payments_path

    expect(response).to be_successful
  end
end