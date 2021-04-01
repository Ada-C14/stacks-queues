class Stack
  def initialize
    @list = LinkedList.new
  end

  def push(element)
    @list.add_last(element)
  end

  def pop
    raise ArgumentError, 'Stack is empty' if @list.empty?

    @list.remove_last
  end

  def empty?
    return @list.length.zero?
  end

  def to_s
    return @list.to_s
  end
end
