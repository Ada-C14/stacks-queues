class Queue

  def initialize
    @store = LinkedList.new()
  end

  def enqueue(element)
    @store.add_last(element)
  end

  def dequeue
    @store.remove_first
  end

  def front
    @store.get_at_index(0)
  end

  def size
    @store.size
  end

  def empty?
    @store.empty? ? true : false
  end

  def to_s
    return @store.to_s
  end
end
