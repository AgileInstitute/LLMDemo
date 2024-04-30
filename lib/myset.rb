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
end