# frozen_string_literal: true

require "rails_helper"

RSpec.describe "POST /host/properties", type: :request do
  before { sign_in user }

  context "when valid params" do
    let(:user) { FactoryBot.create(:user, :host) }
  
    it "create property and redirect" do  
      post host_properties_path, params: {
        property: {
          name: "name",
          headline: "headline",
          description: "description",
          address_1: "address_1",
          address_2: "address_2",
          city: "city",
          state: "state",
          zip_code: "1234",
          country_code: "US"
        }
      }

      expect(response).to be_redirect 
    end
  end

  context "when invalid params" do
    let(:user) { FactoryBot.create(:user, :host) }
  
    it "create property and redirect" do  
      post host_properties_path, params: {
        property: {
          name: "name"
        }
      }

      expect(response).to be_successful 
    end
  end
end