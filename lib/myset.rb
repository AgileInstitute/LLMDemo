class MySet
  def initialize(elements)
    @elements = elements.uniq
  end

  def isEmpty
    @elements.empty?
  end

  def has(element)
    @elements.include?(element)
  end

  def intersect_with(other_set)
    intersection_elements = @elements & other_set.instance_variable_get(:@elements)
    MySet.new(intersection_elements)
  end

  def union(other_set)
    union_elements = @elements | other_set.instance_variable_get(:@elements)
    MySet.new(union_elements)
  end

  def is_superset_of(other_set)
    (other_set.instance_variable_get(:@elements) - @elements).empty?
  end
end
