module Users
  module Changesets
    class Update
      def self.map(tuple)
        tuple.select { |attr| User.attribute_names.include?(attr.to_s) }
      end
    end
  end
end