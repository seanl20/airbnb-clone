class AddCountryCodeToProperties < ActiveRecord::Migration[7.2]
  def change
    add_column :properties, :country_code, :string
  end
end
