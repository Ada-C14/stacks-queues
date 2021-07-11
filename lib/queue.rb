class Queue

  def initialize
    @store = LinkedList.new
  end

  def enqueue(element)
    @store.add_last(element)
  end

  def dequeue
    return nil if self.empty?
    return @store.remove_first
  end

  def front
    @store.get_last
  end

  def size
    return @store.length
  end

  def empty?
    return @store.empty?
  end

  def to_s
    return @store.to_s
  end
end
