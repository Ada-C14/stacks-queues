class Queue

  def initialize
    @size = 10
    @store = Array.new(@size)
    @front = 0
    @back = 0
  end

  def enqueue(element)
    # Check for full
   if @front == (@back + 1) % @size
      self.expand
    end

    @store[@back] = element
    @back = (@back + 1) % @size
  end

  def dequeue
    if self.empty?
      return nil
    end

    value = @store[@front]
    @front = (@front + 1) % @size
    return value
  end

  def front
    return @store[@front]
  end

  def size
    return @size
  end

  def empty?
    return (@front == @back)
  end

  def expand
    # Initialize new array
    @new_store = []
    new_back = 0

    # Dequeue elements into new circular buffer
    value = self.dequeue
    while value
      new_back += 1
      @new_store.push(value)
      value = self.dequeue
    end

    # Set new front back and size
    @front = 0
    @back = new_back
    @size *= 2

    # Pad new blank elements to fill out new size of buffer
    @new_store += Array.new(@new_store.length)
    @store = @new_store
  end

  def to_s
    return @store[@front..(@back-1)].to_s
  end
end
