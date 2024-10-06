class AddUniqueIndexToFavourites < ActiveRecord::Migration[7.2]
  def change
    add_index :favourites, [:property_id, :user_id], unique: true
  end
end
