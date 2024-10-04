# frozen_string_literal: true

require "rails_helper"

RSpec.describe Favourite, type: :model do
  it { belong_to :user }
  it { belong_to :property }
end