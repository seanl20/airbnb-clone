# frozen_string_literal: true

module Hostify
  module Commands
    class UserHost
      def call(user_id:)
        Repositories::UserRepo.new.hostify(id: user_id)
      end
    end
  end
end
