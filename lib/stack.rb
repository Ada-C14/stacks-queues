class Stack
  def initialize
    # @store = ...
    # raise NotImplementedError, "Not yet implemented"
    @store = LinkedList.new
  end

  def push(element)
    # raise NotImplementedError, "Not yet implemented"
    @store.add_first(element)
  end

  def pop
  #   raise NotImplementedError, "Not yet implemented"
    return nil if self.empty?
    item = @store.remove_first
    return item
  end

  def empty?
    # raise NotImplementedError, "Not yet implemented"
    return @store.empty?
  end

  def to_s
    return @store.to_s
  end
end
