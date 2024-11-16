# frozen_string_literal: true

module Properties
  module Queries
    class AllByUser < Query
      def call(user:)
        Repositories::PropertiesRepo.new.get_by_user(user:)
      end
    end
  end
end
