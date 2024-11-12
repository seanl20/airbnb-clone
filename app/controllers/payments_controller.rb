# frozen_string_literal: true

class PaymentsController < ApplicationController
  before_action :authenticate_user!

  def index
    @payments = Payments::Queries::ListByUserId.new.call(user_id: current_user.id)
  end
end