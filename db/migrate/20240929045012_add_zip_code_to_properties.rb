class AddZipCodeToProperties < ActiveRecord::Migration[7.2]
  def change
    add_column :properties, :zip_code, :string
  end
end
