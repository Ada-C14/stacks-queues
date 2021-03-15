class Queue

  MAX_BUFFER = 20 # max items in queue at a given time

  # Time Complexity: O(1), always initializing constant elements
  # Space Complexity: O(1), always initializing same number of elements
  def initialize
    @store = [] # circular buffer
    @head_index = 0 # track index of head
    @tail_index = 0 # track index of tail
    @size = 0 # track size
  end

  def enqueue(element)
    raise NotImplementedError, "Not yet implemented"
  end

  def dequeue
    raise NotImplementedError, "Not yet implemented"
  end

  def front
    raise NotImplementedError, "Not yet implemented"
  end

  def size
    raise NotImplementedError, "Not yet implemented"
  end

  def empty?
    raise NotImplementedError, "Not yet implemented"
  end

  def to_s
    return @store.to_s
  end
end
