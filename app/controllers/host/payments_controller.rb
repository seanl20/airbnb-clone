# frozen_string_literal: true

module Host
  class PaymentsController < ApplicationController
    before_action :authenticate_user!

    def index
      authorize current_user, policy_class: HostPolicy
      @payments = Payments::Queries::ListReceivingPayments.new.call(user_id: current_user.id)
    end
  end
end
