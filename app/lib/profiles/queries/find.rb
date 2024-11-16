# frozen_string_literal: true

module Profiles
  module Queries
    class Find < Query
      def call(id:)
        Repositories::ProfileRepo.new.get(id:)
      end
    end
  end
end
