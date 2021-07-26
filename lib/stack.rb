class Stack
  def initialize
    @stack = LinkedList.new
  end

  def push(element)
    @stack.add_last(element)
  end

  def pop
    return nil if self.empty?

    popped = @stack.remove_last

    return popped
  end

  def empty?
    return @stack.empty?
  end

  def to_s
    return @stack.to_s
  end
end
