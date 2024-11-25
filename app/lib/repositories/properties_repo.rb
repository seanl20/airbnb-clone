module Repositories
  class PropertiesRepo
    def get(id:)
      Property.find(id)
    end

    def get_by_user(user:)
      Property.includes(:reservations).where(user:)
    end

    def create(attrs:)
      Property.create!(attrs)
    end

    def filter_search(params:)
      properties = Property.all

      properties = properties.where("lower(city) LIKE ?", "%#{params["city"].downcase}%") if params["city"].present?
      properties = properties.where("lower(country_code) LIKE ?", "%#{params["country_code"].downcase}%") if params["country_code"].present?

      properties_without_reservations_ids = properties.includes(:reservations).select { |property| property.reservations.size.zero? }.map(&:id)
      
      properties = properties.joins(:reservations)
        .where("reservations.checkin_date <= ?", Date.strptime(params["checkin_date"], Constants::Reservations::CHECK_IN_OUT_DATE_FORMAT))
        .where("reservations.checkout_date >= ?", Date.strptime(params["checkout_date"], Constants::Reservations::CHECK_IN_OUT_DATE_FORMAT))

      properties = Property.where(id: properties_without_reservations_ids + properties.ids)
    end
  end
end