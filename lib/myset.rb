class MySet
  def initialize(elements)
    @elements = elements.uniq
  end

  # Checks if the set is empty
  def isEmpty
    @elements.empty?
  end

  # Checks for element presence
  def has(element)
    @elements.include?(element)
  end

  # Returns a new MySet with elements common to both sets
  def intersect_with(other)
    intersection = @elements & other.instance_variable_get(:@elements)
    MySet.new(intersection)
  end

  # Returns a new MySet with all elements from both sets, excluding duplicates
  def union(other)
    union = @elements | other.instance_variable_get(:@elements)
    MySet.new(union)
  end

  # Checks if the set is a superset
  def is_superset_of(other)
    (@elements & other.instance_variable_get(:@elements)).sort == other.instance_variable_get(:@elements).sort
  end

  # Checks if the set is a subset
  def is_subset_of(other)
    (other.instance_variable_get(:@elements) & @elements).sort == @elements.sort
  end
end