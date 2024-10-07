class AddNullFalseConstraintToReservationDate < ActiveRecord::Migration[7.2]
  def change
    change_column :reservations, :reservation_date, :date, null: false
  end
end
