class MySet
  def initialize(elements = [])
    @elements = elements.uniq
  end

  def intersect_with(other)
    common_elements = @elements.select { |element| other.has(element) }
    MySet.new(common_elements)
  end

  def union(other)
    combined_elements = @elements + other.to_a
    MySet.new(combined_elements)
  end

  def isEmpty
    @elements.empty?
  end

  def has(element)
    @elements.include?(element)
  end

  def to_a
    @elements
  end
end
