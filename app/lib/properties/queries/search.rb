# frozen_string_literal: true

module Properties
  module Queries
    class Search < Query
      def call(params:)
        Repositories::PropertiesRepo.new.filter_search(params:)
      end
    end
  end
end
