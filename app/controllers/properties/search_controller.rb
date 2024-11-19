# frozen_string_literal: true

module Properties
  class SearchController < ApplicationController

    def index
      @properties = Properties::Queries::Search.new.call(params: search_params)
    end

    private

    def search_params
      params.permit(
        :city,
        :country_code,
        :checkin_date,
        :checkout_date 
      )
    end
  end
end