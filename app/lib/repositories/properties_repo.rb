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
  end
end