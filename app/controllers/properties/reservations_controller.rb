# frozen_string_literal: true

module Properties
  class ReservationsController < ApplicationController
    before_action :authenticate_user!

    def new
      @property, @reservation, @reservations_parameters = Properties::Reservations::Queries::New.new.call(id: params[:property_id], params: new_reservation_params)
    end

    private

    def new_reservation_params
      params.permit(
        :checkin_date, 
        :checkout_date, 
        :subtotal, 
        :cleaning_fee, 
        :service_fee, 
        :total
      )
    end
  end
end