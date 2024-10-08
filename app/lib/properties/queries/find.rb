# frozen_string_literal: true

module Properties
  module Queries
    class Find
      def call(id:)
        property = Repositories::PropertiesRepo.new.get(id:)

        return property
      end
    end
  end
end
