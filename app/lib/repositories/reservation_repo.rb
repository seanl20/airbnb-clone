module Repositories
  class ReservationRepo
    def create(attrs:)
      Reservation.create!(Reservations::Changesets::Create.map(attrs))
    end
  end
end