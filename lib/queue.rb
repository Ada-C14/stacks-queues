class Queue
  SIZE = 20
  def initialize
    @store = Array.new(SIZE)
    @front = @back = 0
  end

  def enqueue(element)
    queue_is_full = (@back + 1) % @store.length == @front
    if queue_is_full #queue is full
      raise ArgumentError.new("queue is full")
    end
      @store[@back] = element
      @back = (@back + 1) % @store.length
  end

  def dequeue
    if empty?
     raise ArgumentError.new("queue is empty")
    end
 
    element = @store[@front] #if queue is not empty
    @front = (@front + 1) % @store.length
    return element
  end

  def front
    return @store[@front]
  end

  def size
    return @back >= @front ? (@back - @front) : (@store.length - @front + @back)
  end

  def empty?
    return @front == @back
  end

  def to_s
    i = @front
    real_back = @back < @front ? @back + @store.length : @back
    result = []
    while i < real_back
      result << @store[i % @store.length]
      i += 1
    end
    return result.to_s
  end
end
