# frozen_string_literal: true
module Favourites
  module Commands
    class Delete < Command
      def call(favourite_id:)
        Repositories::FavouritesRepo.new.delete(favourite_id:)
      end
    end
  end
end
