class Stack
  def initialize
    @store = LinkedList.new
    # raise NotImplementedError, "Not yet implemented"
  end

  def push(element)
    # raise NotImplementedError, "Not yet implemented"
    # element into the store
    @store.add_first(element)
  end

  def pop
    # raise NotImplementedError, "Not yet implemented"
    @store.remove_first
  end

  def empty?
    # raise NotImplementedError, "Not yet implemented"
    return @store.empty?
  end

  def to_s
    return @store.to_s
  end
end
