class Queue

  def initialize
    @list = LinkedList.new
  end

  def enqueue(element)
    @list.add_last(element)
  end

  def dequeue
    return nil if self.empty?
    return @list.remove_first
  end

  def front
  end

  def size
  end

  def empty?
    return @list.empty?
  end

  def to_s
    return @list.to_s
  end
end
