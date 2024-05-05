require 'set'

class MySet
  def initialize(elements)
    @set = Set.new(elements)
  end

  def is_superset_of(other_set)
    @set.superset?(other_set.instance_variable_get(:@set))
  end

  def intersect_with(other_set)
    intersection = @set & other_set.instance_variable_get(:@set)
    MySet.new(intersection.to_a)
  end

  def union(other_set)
    unionized = @set | other_set.instance_variable_get(:@set)
    MySet.new(unionized.to_a)
  end

  def isEmpty
    @set.empty?
  end

  def has(element)
    @set.include?(element)
  end
end
