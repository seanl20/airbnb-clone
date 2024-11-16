# frozen_string_literal: true

module Properties
  module Reservations
    module Queries
      class New < Query
        def call(id:, params:)
          property = Repositories::PropertiesRepo.new.get(id:)

          reservation = property.reservations.new

          reservations_parameters = Properties::Reservations::Structs::Parameters.new(
            checkin_date: params[:checkin_date],
            checkout_date: params[:checkout_date],
            subtotal: params[:subtotal],
            cleaning_fee: params[:cleaning_fee],
            service_fee: params[:service_fee],
            total: params[:total],
            number_of_nights: (Date.strptime(params[:checkout_date], Constants::Reservations::CHECK_IN_OUT_DATE_FORMAT) - Date.strptime(params[:checkin_date], Constants::Reservations::CHECK_IN_OUT_DATE_FORMAT)).to_i
          )

          return property, reservation, reservations_parameters
        end
      end
    end
  end
end
