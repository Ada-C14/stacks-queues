class Stack
  def initialize
    @store = LinkedList.new
  end

  def push(element)
    @store.add_first(element)
  end

  def pop
    return nil if self.empty?

    element = @store.remove_first

    return element
  end

  def empty?
    return @store.empty?
  end

  def to_s
    return @store.to_s
  end
end