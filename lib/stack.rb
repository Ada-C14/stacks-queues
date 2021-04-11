class Stack
  def initialize
    # @store = ...
    @list = LinkedList.new
  end

  def push(element)
    @list.add_first(element)
  end

  def pop
    return nil if self.empty?
    element = @list.remove_first
    return element
  end

  def empty?
    return @list.empty?
  end

  def to_s
    return @store.to_s
  end
end
