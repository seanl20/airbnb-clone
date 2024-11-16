# frozen_string_literal: true

require "dry/monads"

class Query
  include Dry::Monads[:result, :try]

  class << self
    def inherited(klass)
      klass.include Dry::Monads[:do]
    end
  end
end
