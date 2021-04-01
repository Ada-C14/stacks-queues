class Stack
  def initialize
    @list = LinkedList.new
  end

  def push(element)
    @list.add_last(element)
  end

  def pop
    raise NotImplementedError, "Not yet implemented"
  end

  def empty?
    raise NotImplementedError, "Not yet implemented"
  end

  def to_s
    return @store.to_s
  end
end
