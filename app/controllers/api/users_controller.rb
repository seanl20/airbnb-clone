# frozen_string_literal: true

module Api
  class UsersController < ApplicationController
    def show
      @user = Repositories::UserRepo.new.get(id: params[:id])

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