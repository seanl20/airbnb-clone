# frozen_string_literal: true

require "rails_helper"

RSpec.describe User, type: :model do
  it { should have_one(:profile).dependent(:destroy) }
  it { should have_many(:favourites).dependent(:destroy) }
  it { should have_many(:favourited_properties).through(:favourites).source(:property) }
  it { should have_many(:reservations).dependent(:destroy) }
  it { should have_many(:payments).through(:reservations) }
  it { should have_many(:reserved_properties).through(:reservations).source(:property) }
  it { should have_many(:reviews).dependent(:destroy) }
end