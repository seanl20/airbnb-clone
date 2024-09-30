class AddPriceCentsToProperties < ActiveRecord::Migration[7.2]
  def change
    add_monetize :properties, :price, amount: { null: true, default: nil }, currency: { null: true, default: nil }
  end
end
