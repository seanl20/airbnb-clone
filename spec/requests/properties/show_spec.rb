# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Properties", type: :request do
  let(:property) { FactoryBot.create(:property) }

  it "returns a successful response" do
    get property_path(property)

    expect(response).to be_successful
  end
end