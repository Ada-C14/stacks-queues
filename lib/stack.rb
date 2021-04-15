class Stack
  def initialize
    @store = LinkedList.new()
  end

  def push(element)
    @store.add_first(element)
  end

  def pop
    return nil if @store.empty?
    @store.remove_first
  end

  def empty?
    return true if @store.empty?
    return false
  end

  def to_s
    return @store.to_s
  end
end
