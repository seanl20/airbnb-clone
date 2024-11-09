class DropCountryFromProfiles < ActiveRecord::Migration[7.2]
  def change
    remove_column :profiles, :country
  end
end
