require 'rails_helper'

RSpec.describe Payment, type: :model do
  it { should belong_to(:reservation) }

  it { is_expected.to monetize(:subtotal).allow_nil }
  it { is_expected.to monetize(:cleaning_fee).allow_nil }
  it { is_expected.to monetize(:service_fee).allow_nil }
  it { is_expected.to monetize(:total).allow_nil }
end
