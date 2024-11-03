class DropReservationDateFromReservations < ActiveRecord::Migration[7.2]
  def change
    remove_column :reservations, :reservation_date
  end
end
