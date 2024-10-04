# frozen_string_literal: true
module Favourites
  module Commands
    class Delete
      def call(favourite_id:)
        Repositories::FavouritesRepo.new.delete(favourite_id:)
      end
    end
  end
end
