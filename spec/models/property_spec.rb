# frozen_string_literal: true

require "rails_helper"

RSpec.describe Property, type: :model do
  context "validates" do
    it { should validate_presence_of(:name) }
    it { should validate_presence_of(:headline) }
    it { should validate_presence_of(:description) }
    it { should validate_presence_of(:address_1) }
    it { should validate_presence_of(:city) }
    it { should validate_presence_of(:state) }
    it { should validate_presence_of(:country_code) }
    it { is_expected.to monetize(:price).allow_nil }

    it { should have_many(:reviews) }

    it { should have_many(:favourites).dependent(:destroy) }
    it { should have_many(:favourited_users).through(:favourites).source(:user) }
    it { should have_many(:reservations).dependent(:destroy) }
    it { should have_many(:payments).through(:reservations) }
    it { should have_many(:reserved_users).through(:reservations).source(:user) }

    it { should belong_to(:user) }
  end
end