# frozen_string_literal: true

module Api
  class FavouritesController < ApplicationController
    protect_from_forgery with: :null_session

    def create
      favourite = Favourites::Commands::Create.new.call(
        user_id: favourite_params["user_id"], 
        property_id: favourite_params["property_id"]
      )

      respond_to do |format|
        format.json do
          render json: serialize_favourite(favourite), status: :created
        end
      end
    end

    def destroy
      favourite = Favourites::Commands::Delete.new.call(favourite_id: params[:id])

      respond_to do |format|
        format.json do
          render json: serialize_favourite(favourite), status: 204
        end
      end
    end

    private

    def favourite_params
      params.permit(:user_id, :property_id)
    end

    def serialize_favourite(favourite)
      ::FavouriteSerializer.new(favourite).serializable_hash[:data].to_json
    end
  end
end
