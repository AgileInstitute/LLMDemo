class MySet
  def initialize(elements = [])
    @elements = elements.uniq
  end

  def has(element)
    @elements.include?(element)
  end

  def isEmpty
    @elements.empty?
  end

  def union(other_set)
    united_elements = @elements + other_set.to_a
    MySet.new(united_elements)
  end

  def to_a
    @elements
  end
end

# Assuming the 'myset' library file is named myset.rb