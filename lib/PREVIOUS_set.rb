class Set
  include Enumerable

  def initialize(array_of_elements)
    @elements = array_of_elements
  end

  def has(item)
    found_items = @elements.select { |thing| thing == item }
    found_items.count > 0
  end
end
