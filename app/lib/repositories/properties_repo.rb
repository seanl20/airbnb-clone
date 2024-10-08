module Repositories
  class PropertiesRepo
    def get(id:)
      Property.find(id)
    end
  end
end