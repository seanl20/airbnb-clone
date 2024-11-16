# frozen_string_literal: true

module Properties
  module Commands
    class Create < Command
      def call(params:, user:)
        attrs = params[:images] ? Properties::Changesets::Create.map(params).merge({
          images: params[:images], user:
        }) : Properties::Changesets::Create.map(params).merge({ user: })

        property = yield create_property(attrs:)

        Success(property:)
      end

      def create_property(attrs:)
        Success(Repositories::PropertiesRepo.new.create(attrs:))
      rescue ActiveRecord::RecordInvalid
        Failure(:invalid)
      end
    end
  end
end
