# frozen_string_literal: true

require "rails_helper"

RSpec.describe "PUT /profiles/:id", type: :request do
  let(:user) { FactoryBot.create(:user) }

  it "returns a successful response" do
    put password_path(user), params: {
      password: {
        password: "testpass"
      }
    }

    expect(response).to be_redirect
  end
end