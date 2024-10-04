# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Api::Favourites", type: :request do
  let!(:headers) do
    {
      "ACCEPT" => "application/json"
    }
  end
  let!(:user) { FactoryBot.create(:user) }
  let!(:property) { FactoryBot.create(:property) }

  before { sign_in user}

  describe "POST create" do
    let(:params) do 
      {
        user_id: user.id,
        property_id: property.id
      }
    end

    it "create a new favourites" do 
      post api_favourites_path, params:, headers: headers

      expect(response.status).to eq(201)
    end
  end

  describe "DELETE destroy" do
    let!(:favourite) { FactoryBot.create(:favourite, user:, property:) }

    it "create a new favourites" do 
      delete api_favourite_path(favourite), headers: headers

      expect(response.status).to eq(204)
    end
  end
end