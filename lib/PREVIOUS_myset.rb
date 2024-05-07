class MySet
  def initialize(elements)
    raise 'Nil element detected' if elements.any?(&:nil?)
    @elements = elements.uniq
  end

  def isEmpty
    @elements.empty?
  end

  def has(element)
    @elements.include?(element)
  end

  def intersect_with(other_set)
    common_elements = @elements & other_set.instance_variable_get(:@elements)
    MySet.new(common_elements)
  end

  def union(other_set)
    combined_elements = @elements | other_set.instance_variable_get(:@elements)
    MySet.new(combined_elements)
  end

  def is_superset_of(other_set)
    (other_set.instance_variable_get(:@elements) - @elements).empty?
  end

  def is_subset_of(other_set)
    (@elements - other_set.instance_variable_get(:@elements)).empty?
  end
end