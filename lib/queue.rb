class Queue
  SIZE = 20
  def initialize
    @store = Array.new(SIZE)
    @front = @back = 0
  end

  def enqueue(element)
    if (@back + 1) % @store.length == @front #queue is full
      # raise exception
    end
      @store[@back] = element
      @back = (@back + 1) % @store.length
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
    i = @front
    result = []
    while i < @back
      result << @store[i]
      i += 1
    end
    return result.to_s
  end
end
