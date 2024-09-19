# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Api::Users", type: :request do
  describe "GET show" do
    context "user exists" do
      let(:user) { FactoryBot.create(:user) }

      it "is successful" do
        get api_user_path(user)
        expect(response).to be_successful
      end
    end

    context "user does not exists" do
      it "is not found" do

      end
    end
  end
end