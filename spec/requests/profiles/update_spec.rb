# frozen_string_literal: true

require "rails_helper"

RSpec.describe "PUT /profiles/:id", type: :request do
  let(:user) { FactoryBot.create(:user) }
  let(:profile) { FactoryBot.create(:profile, user:, first_name: "John", last_name: "Doe") }

  before { sign_in user }

  it "returns a successful response" do
    put profile_path(profile), params: {
      profile: {
        first_name: "Test"
      }
    }

    expect(response).to be_redirect
    expect(profile.reload.first_name).to eq("Test")
  end
end