class Box
  def initialize
    @items = []
  end

  def add(item)
    @items << item
  end

  def remove(item)
    @items.delete(item)
  end

  def has(item)
    @items.include?(item)
  end

  def colors(item_type)
    @items.select { |item| item.split.last == item_type }.map { |item| item.split.first }.uniq
  end

  def number_of_items
    @items.count
  end
end