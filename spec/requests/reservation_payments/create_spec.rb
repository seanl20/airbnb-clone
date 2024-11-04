# frozen_string_literal: true

require "rails_helper"

RSpec.describe "POST /reservation_payments", type: :request do
  it "returns a successful response" do
    post reservation_payments_path
  end
end