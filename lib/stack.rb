class Stack
  def initialize
    @store = LinkedList.new
  end

  def push(element)
    @store.add_first(item)
  end

  def pop
    return nil if self.empty?
    item = list.remove_first
    return item
  end

  def empty?
    return @list.empty?
  end

  def to_s
    return @store.to_s
  end
end
