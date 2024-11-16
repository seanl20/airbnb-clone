# frozen_string_literal: true
module Users
  module Queries
    class FindByEmail < Query
      def call(email:)
        user = Repositories::UserRepo.new.get_by_email(email:)

        return user
      end
    end
  end
end
