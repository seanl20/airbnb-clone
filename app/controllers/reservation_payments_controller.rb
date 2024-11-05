class ReservationPaymentsController < ApplicationController
  def create
    @stripe_customer = ReservationPayments::Queries::Create.new.call(params: reservation_payment_params, user:)
    raise
  end

  private

  def reservation_payment_params
    params.permit(
      :stripeToken,
      :property_id,
      :user_id,
      :checkin_date,
      :checkout_date,
      :subtotal,
      :cleaning_fee,
      :service_fee,
      :total
    )
  end

  def user
    @user ||= User.find(reservation_payment_params[:user_id])
  end
end
