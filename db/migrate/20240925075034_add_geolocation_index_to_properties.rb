class AddGeolocationIndexToProperties < ActiveRecord::Migration[7.2]
  def change
    add_index :properties, [:latitude, :longitude]
  end
end
