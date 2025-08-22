class MySet
  def initialize(elements)
    raise 'nil is not allowed as an element' if elements.include?(nil)
    @elements = elements.uniq
  end

  def isEmpty
    @elements.empty?
  end

  def has(element)
    @elements.include?(element)
  end

  def intersect_with(other_set)
    intersection_elements = @elements & other_set.elements
    MySet.new(intersection_elements)
  end

  def union(other_set)
    union_elements = @elements | other_set.elements
    MySet.new(union_elements)
  end

  def is_superset_of(other_set)
    (other_set.elements - @elements).empty?
  end

  def is_subset_of(other_set)
    (@elements - other_set.elements).empty?
  end

  protected

  def elements
    @elements
  end
end