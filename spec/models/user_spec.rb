# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  it { should have_one(:profile).dependent(:destroy) }
  it { should have_many(:favourites).dependent(:destroy) }
  it { should have_many(:favourited_properties).through(:favourites).source(:property) }
end