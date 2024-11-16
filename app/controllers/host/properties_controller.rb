# frozen_string_literal: true

module Host
  class PropertiesController < ApplicationController
    before_action :authenticate_user!

    def new
      authorize current_user, policy_class: HostPolicy
      @property = Property.new(user: current_user)
    end

    def create
      authorize current_user, policy_class: HostPolicy
      result = Properties::Commands::Create.new.call(params: property_params, user: current_user)

      case result
      in Success(property:)
        redirect_to host_dashboard_path
      in Failure(:invalid)
        render :new
      end
    end

    private

    def property_params
      params.require(:property).permit(
        :name,
        :headline,
        :description,
        :images,
        :address_1,
        :address_2,
        :city,
        :state,
        :zip_code,
        :country_code
      )
    end
  end
end