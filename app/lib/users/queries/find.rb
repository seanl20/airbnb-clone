# frozen_string_literal: true
module Users
  module Queries
    class Find
      def call(id:)
        Repositories::UserRepo.new.get(id:)
      end
    end
  end
end
