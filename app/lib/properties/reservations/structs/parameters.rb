module Properties
  module Reservations
    module Structs
      class Parameters < Dry::Struct
        transform_keys(&:to_sym)

        attribute :checkin_date, Types::String
        attribute :checkout_date, Types::String
        attribute :subtotal, Types::String
        attribute :cleaning_fee, Types::String
        attribute :service_fee, Types::String
        attribute :total, Types::String
        attribute :number_of_nights, Types::Integer
      end
    end
  end
end
