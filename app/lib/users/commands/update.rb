# frozen_string_literal: true

module Users
  module Commands
    class Update
      def call(id:, params:)
        user_update = user_repo.update(id:, attrs: params)

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
