class DropCountryFromProperties < ActiveRecord::Migration[7.2]
  def change
    remove_column :properties, :country
  end
end
