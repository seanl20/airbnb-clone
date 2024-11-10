# frozen_string_literal: true

require "rails_helper"

RSpec.describe "PUT /profiles/:id", type: :request do
  let(:user) { FactoryBot.create(:user) }

  it "returns a successful response" do
    put account_path(user), params: {
      account: {
        email: "email@email.com"
      }
    }

    expect(response).to be_redirect
    expect(user.reload.email).to eq("email@email.com")
  end
end