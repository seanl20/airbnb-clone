# frozen_string_literal: true

module Profiles
  module Commands
    class Update
      def call(id:, params:)
        attrs = params[:picture] ? Profiles::Changesets::Update.map(params).merge({
          picture: params[:picture]
        }) : Profiles::Changesets::Update.map(params)

        profile_update = profile_repo.update(id:, attrs:)

        return nil unless profile_update
        profile_repo.get(id:)
      end

      private

      def profile_repo
        Repositories::ProfileRepo.new
      end
    end
  end
end
