# frozen_string_literal: true

module Payments
  module Queries
    class ListByUserId
      def call(user_id:)
        user = Repositories::UserRepo.new.get(id: user_id)

        user.payments.includes(reservation: :property)
      end
    end
  end
end
