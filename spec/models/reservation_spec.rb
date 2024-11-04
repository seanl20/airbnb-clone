require 'rails_helper'

RSpec.describe Reservation, type: :model do
  it { should belong_to(:property) }
  it { should belong_to(:user) }
  it { should have_one(:payments).dependent(:destroy) }
end
