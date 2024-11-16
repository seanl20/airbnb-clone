module Properties
  module Changesets
    class Create
      def self.map(tuple)
        tuple.select { |attr| Property.attribute_names.include?(attr.to_s) }
      end
    end
  end
end