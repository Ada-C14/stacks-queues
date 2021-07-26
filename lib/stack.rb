class Stack
  def initialize
    @list = LinkedList.new
  end

  def push(element)
    @list.add_first(element)
  end

  def pop
    @list.remove_first
  end

  def empty?
    @list.empty?
  end

  def to_s
    return @store.to_s
  end
end
