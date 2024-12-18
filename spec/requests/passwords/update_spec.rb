# frozen_string_literal: true

require "rails_helper"

RSpec.describe "PUT /profiles/:id", type: :request do
  let(:user) { FactoryBot.create(:user) }

  before { sign_in user }

  it "returns a successful response" do
    put hostify_path(user_id: user.id)

    expect(response).to be_redirect
  end
end