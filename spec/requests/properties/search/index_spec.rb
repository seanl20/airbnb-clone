# frozen_string_literal: true

require "rails_helper"

RSpec.describe "Get /properties/search", type: :request do
  let(:properties) { FactoryBot.create_list(:property, 3) }

  it "returns a successful response" do
    get properties_search_path

    expect(response).to be_successful
  end
end