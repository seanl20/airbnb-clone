# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Api::UserByEmail", type: :request do
  describe "GET show" do
    let!(:headers) do
      {
        "ACCEPT" => "application/json"
      }
    end
    
    context "user exists" do
      let!(:user) { FactoryBot.create(:user, email: "test@email.com") }

      let(:email) { "test@email.com" }

      it "is successful" do
        get api_users_by_email_path, params: { email: email } , headers: headers
        expect(response).to be_successful
      end
    end

    context "user does not exists" do
      let(:email) { "test@email.com" }

      it "is not found" do
        get api_users_by_email_path, params: {email: email}, headers: headers
        expect(response).to be_not_found
      end
    end
  end
end