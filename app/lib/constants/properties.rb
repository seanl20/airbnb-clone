# frozen_string_literal: true

module Constants
  module Properties
    CLEANING_FEE = 5_000.freeze
    CLEANING_FEE_MONEY = Money.new(CLEANING_FEE)
    SERVICE_FEE_PERCENTAGE = (0.08).freeze
  end
end