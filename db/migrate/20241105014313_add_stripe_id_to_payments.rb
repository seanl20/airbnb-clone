class AddStripeIdToPayments < ActiveRecord::Migration[7.2]
  def change
    add_column :payments, :stripe_id, :string
  end
end
