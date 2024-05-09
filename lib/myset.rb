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

  def intersect_with(other)
    intersect_elements = @elements & other.elements
    MySet.new(intersect_elements)
  end

  def union(other)
    union_elements = @elements | other.elements
    MySet.new(union_elements)
  end

  def is_subset_of(other)
    (@elements - other.elements).empty?
  end

  def is_superset_of(other)
    (other.elements - @elements).empty?
  end

  protected

  def elements
    @elements
  end
end