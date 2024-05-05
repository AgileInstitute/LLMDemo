require 'set'

class MySet
  def initialize(elements = [])
    @elements = Set.new(elements)
  end

  def isEmpty
    @elements.empty?
  end

  def has(element)
    @elements.include?(element)
  end

  def intersect_with(other_set)
    intersection = @elements & other_set.elements
    MySet.new(intersection.to_a)
  end

  def union(other_set)
    union = @elements | other_set.elements
    MySet.new(union.to_a)
  end

  def is_superset_of(other_set)
    @elements.superset?(other_set.elements)
  end

  def is_subset_of(other_set)
    @elements.subset?(other_set.elements)
  end

  protected

  def elements
    @elements
  end
end