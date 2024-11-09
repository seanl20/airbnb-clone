# frozen_string_literal: true

require "rails_helper"

RSpec.describe "PUT /profiles/:id", type: :request do
  let(:profile) { FactoryBot.create(:profile, first_name: "John", last_name: "Doe") }

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