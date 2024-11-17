# frozen_string_literal: true

module Payments
  module Queries
    class ListReceivingPayments < Query
      def call(user_id:)
        user = Repositories::UserRepo.new.get(id: user_id)

        user.receiving_payments.includes(reservation: :property)
      end
    end
  end
end
