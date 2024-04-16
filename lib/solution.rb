class Box
  def initialize
    @items = []
  end

  def add(item)
    @items << item
  end

  def colors(obj_type)
    @items.map { |item|
      item.match(/^(\w+)\s+(\w+)$/)
      $1 if $2 == obj_type
    }.compact
  end

  def has(item)
    @items.include?(item)
  end

  def remove(item)
    @items.delete(item)
  end

  def number_of_items
    @items.size
  end
end