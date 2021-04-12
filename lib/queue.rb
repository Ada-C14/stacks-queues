class Queue

  def initialize
    @store = Array.new(20)
    @front = @back = 0
  end

  def enqueue(element)
    if self.full?
      raise NoMemoryError, "Array is full"
    else
      @store[@back] = element
      @back = (@back + 1) % self.size
    end
  end

  def dequeue
    if self.empty?
      raise IndexError, "Array is empty"
    else
      dequeued_element = @store[@front]
      @front = (@front + 1) % self.size
      return dequeued_element
    end
  end

  def front
    return @store[@front]
  end

  def size
    return @store.length
  end

  def empty?
    return @front == @back
  end

  def full?
    return @front == (@back + 1) % self.size
  end

  def to_s
    p "queue is #{@store[@front..@back-1]}"
    p "front is #{@front}"
    p "back is #{@back}"
    return @store[@front..@back-1].to_s
  end
end
