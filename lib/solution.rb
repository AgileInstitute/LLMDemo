class Box
  def initialize
    @items = []
  end

  def add(item)
    @items.push(item)
  end

  def remove(item)
    @items.delete(item)
  end

  def has(item)
    @items.include?(item)
  end

  def number_of_items
    @items.count
  end
end
