# frozen_string_literal: true

require "rails_helper"

RSpec.describe "GET /host/dashboard/", type: :request do
  before { sign_in user }

  context "when user is a host" do
    let(:user) { FactoryBot.create(:user, :host) }
  
    it "returns a successful response" do
      get new_host_property_path
  
      expect(response).to be_successful 
    end
  end

  context "when user is not a host" do
    let(:user) { FactoryBot.create(:user) }
  
    it "returns a not authorize error" do  
      expect{
        get new_host_property_path
      }.to raise_exception(Pundit::NotAuthorizedError)
    end
  end
end