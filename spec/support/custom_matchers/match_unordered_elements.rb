require "rspec"

class MatchUnorderedElements < RSpec::Matchers::BuiltIn::ContainExactly
end

def match_unordered_elements(*expected_items)
  MatchUnorderedElements.new(expected_items)
end
