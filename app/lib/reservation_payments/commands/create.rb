# frozen_string_literal: true

module ReservationPayments
  module Commands
    class Create < Command
      def call(params:, user:)
        stripe_customer = get_stripe_customer(user:)

        stripe_card = create_stripe_customer_source(stripe_customer:, params:)

        charge = create_charge(params:, stripe_customer:, stripe_card:)

        property = get_property(property_id: params[:property_id])

        reservation = create_reservation(property:, user:, params:)

        payment = create_payment(reservation:, params:, charge:)
      end

      def get_stripe_customer(user:)
        if user.stripe_id.blank?
          stripe_customer = Stripe::Customer.create(email: user.email)
          Repositories::UserRepo.new.update(id: user.id, attrs: {stripe_id: stripe_customer.id})
        else
          stripe_customer = Stripe::Customer.retrieve(user.stripe_id)
        end

        stripe_customer
      end

      def create_stripe_customer_source(stripe_customer:, params:)
        Stripe::Customer.create_source(
          stripe_customer.id,
          { source: params[:stripeToken] }
        )
      end

      def create_charge(params:, stripe_customer:, stripe_card:)
        Stripe::Charge.create(
          amount: Money.from_amount(BigDecimal(params[:total])).cents,
          currency: "USD",
          source: stripe_card.id,
          customer: stripe_customer.id
        )
      end

      def get_property(property_id:)
        Repositories::PropertiesRepo.new.get(id: property_id)
      end

      def create_reservation(property:, user:, params:)
        Repositories::ReservationRepo.new.create(attrs: {
          user_id: user.id, 
          property_id: property.id,
          checkin_date: Date.strptime(params[:checkin_date], Constants::Reservations::CHECK_IN_OUT_DATE_FORMAT),
          checkout_date: Date.strptime(params[:checkout_date], Constants::Reservations::CHECK_IN_OUT_DATE_FORMAT)
        })
      end

      def create_payment(reservation:, params:, charge:)
        Repositories::PaymentRepo.new.create(
          attrs: {
            reservation_id: reservation.id,
            stripe_id: charge.id
          }, monetize_attrs: {
            subtotal: Money.from_amount(BigDecimal(params[:subtotal])),
            cleaning_fee: Money.from_amount(BigDecimal(params[:cleaning_fee])),
            service_fee: Money.from_amount(BigDecimal(params[:service_fee])),
            total: Money.from_amount(BigDecimal(params[:total]))
          }
        )
      end
    end
  end
end
