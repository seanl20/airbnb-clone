module Repositories
  class FavouritesRepo
    def create(user_id:, property_id:)
      Favourite.create!(
        user_id:,
        property_id:
      )
    end

    def delete(favourite_id:)
      Favourite.find(favourite_id).destroy
    end
  end
end