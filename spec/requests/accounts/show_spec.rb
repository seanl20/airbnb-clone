# frozen_string_literal: true

require "rails_helper"

RSpec.describe "GET /accounts/:id", type: :request do
  let(:user) { FactoryBot.create(:user) }

  before { sign_in user }

  it "returns a successful response" do
    get account_path(user)

    expect(response).to be_successful
  end
end