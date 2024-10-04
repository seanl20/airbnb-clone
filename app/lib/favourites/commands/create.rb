# frozen_string_literal: true
module Favourites
  module Commands
    class Create
      def call(user_id:, property_id:)
        favourite = Repositories::FavouritesRepo.new.create(user_id:, property_id:)

        return favourite
      end
    end
  end
end
