# frozen_string_literal: true

module Users
  module Commands
    class UpdatePassword
      def call(id:, password:)
        user_update = user_repo.update_password(id:, password:)

        return nil unless user_update
        user_repo.get(id:)
      end

      private

      def user_repo
        Repositories::UserRepo.new
      end
    end
  end
end
