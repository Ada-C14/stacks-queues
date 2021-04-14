class Queue

  ARRAY_SIZE = 20

  def initialize
    @store = Array.new(ARRAY_SIZE)
    @front = @back = 0
  end

  def enqueue(element)
    if self.full?
      raise NoMemoryError, "Array is full"
    else
      @store[@back] = element
      @back = (@back + 1) % ARRAY_SIZE
    end
  end

  def dequeue
    if self.empty?
      raise IndexError, "Array is empty"
    else
      dequeued_element = @store[@front]
      @store[@front] = nil
      @front = (@front + 1) % ARRAY_SIZE
      return dequeued_element
    end
  end

  def front
    return @store[@front]
  end

  def size
    return @front < @back ? @back - @front : @store.length + @back - @front
  end

  def empty?
    return @front == @back
  end

  def full?
    return @front == (@back + 1) % ARRAY_SIZE
  end

  def to_s
    string = "["
    i = @front
    until i == @back - 1
      string << "#{@store[i]}, "
      i = (i + 1) % ARRAY_SIZE
    end

    string << "#{@store[@back - 1]}]"
    return string
  end
end
