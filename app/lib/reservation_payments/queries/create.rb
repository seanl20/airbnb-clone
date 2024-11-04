# frozen_string_literal: true

module ReservationPayments
  module Queries
    class Create
      def call(params:, user:)
        stripe_customer = get_stripe_customer(user:)

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
    end
  end
end
