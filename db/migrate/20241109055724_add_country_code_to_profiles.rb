class AddCountryCodeToProfiles < ActiveRecord::Migration[7.2]
  def change
    add_column :profiles, :country_code, :string
  end
end
