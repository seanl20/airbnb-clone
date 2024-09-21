# frozen_string_literal: true

module Api
  class UserByEmailController < ApplicationController
    def show
      @user = Users::Queries::FindByEmail.new.call(email: params[:email])

      respond_to do |format|
        format.json do
          render json: @user.to_json, status: :ok
        end
      end
    rescue ActiveRecord::RecordNotFound => e
      respond_to do |format|
        format.json do
          render json: { error: e.message}.to_json, status: :not_found
        end
      end
    end
  end
end
