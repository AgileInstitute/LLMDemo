# Implementation to satisfy the given RSpec tests
require 'set'

class Set
  # Overriding the initializer to make sure it doesn't conflict
  # with the default Set class of Ruby
  def initialize(items = [])
    @items = items
  end

  # Method to check if an item exists in the set
  def has(item)
    @items.include?(item)
  end
end

# Note: This implementation assumes that the intention is to extend or modify the behavior
# of a custom Set class rather than the standard Set library in Ruby. Thus, to avoid
# potential conflicts and to clarify intention, a different class name or
# namespace should be considered for a real-world application.