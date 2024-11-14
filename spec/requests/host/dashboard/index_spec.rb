# frozen_string_literal: true

require "rails_helper"

RSpec.describe "GET /host/dashboard/", type: :request do
  before { sign_in user }

  context "when user is a host" do
    let(:user) { FactoryBot.create(:user, :host) }
  
    it "returns a successful response" do
      get host_dashboard_path
  
      expect(response).to be_successful 
    end
  end

  context "when user is not a host" do
    let(:user) { FactoryBot.create(:user) }
  
    it "returns a not authorize error" do  
      expect{
        get host_dashboard_path
      }.to raise_exception(Pundit::NotAuthorizedError)
    end
  end
end