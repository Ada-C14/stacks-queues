class Queue

  def initialize
    @store = Array.new(20)
    @size = 20
    @front = -1
    @rear = -1
  
  end

  def enqueue(element)

    if (@front == 0 && @rear == @size - 1) ||
      (@rear == (@front - 1) % (@size - 1))
      raise ArgumentError.new("Error: Queue is full")
    elsif @front == -1 # queue is empty
      @front = @rear = 0
      @store[@rear] = element
    elsif @rear == @size - 1 && @front != 0 # rear needs to wrap around
      @rear = 0
    else 
      @rear += 1
    end
    @store[@rear] = element
  end

  def dequeue
    if @front == -1
      raise RuntimeError.new("The queue is empty")
    end

    removed_data = @store[@front]
    @store[@front] = nil

    if @front == @rear # now queue is empty
      @front = -1
      @rear = -1
    elsif @front == @size - 1
      @front = 0
    else 
      @front += 1
    end
    return removed_data
  end

  def front
    return @store[@front]
  end

  def size
    @size
  end

  def empty?
    return @front == -1 ? 0 : @back - @front + 1
  end

  def to_s
    result = []
    i = @front
    while i < size && @store[i] != nil
      result << @store[i]
      i += 1
    end

    if @rear < @front
      i = @rear
      while i < @front && @store[i] != nil
        result << @store[i]
        i += 1
      end
    end

    return result.to_s
  end
end
