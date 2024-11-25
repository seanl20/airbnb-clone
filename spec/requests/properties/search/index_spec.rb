# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Get /properties/search", type: :request do
  let(:properties) { FactoryBot.create_list(:property, 3) }

  it "returns a successful response" do
    get properties_search_path,params: {
      checkin_date: "11/03/2024",
      checkout_date: "11/05/2024"
    }

    expect(response).to be_successful
  end
end