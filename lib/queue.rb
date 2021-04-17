class Queue

  MAX_SIZE = 20

  def initialize
    # @store = ...
    # raise NotImplementedError, "Not yet implemented"
    @store = Array.new(MAX_SIZE)
    @front = -1
    @rear = -1
  end

  def enqueue(element)
    # raise NotImplementedError, "Not yet implemented"
    if (@front == 0 && @rear == MAX_SIZE - 1) || (@rear == (@front - 1) % (MAX_SIZE - 1))
      raise ArgumentError.new("The queue is full.")
    elsif @front == -1 
      @front = 0
      @rear = 0
    elsif @rear == MAX_SIZE - 1 && @front != 0 
      @rear = 0
    else
      @rear += 1
    end
    @store[@rear] = element
  end

  def dequeue
    # raise NotImplementedError, "Not yet implemented"
    return nil if @store.empty?
    raise ArgumentError.new("Queue is empty") if @front == -1
    data =@store[@front]
    @store[@front] = nil

    if @front == @rear
      @front = -1
      @rear = -1
    elsif @front == MAX_SIZE - 1
      @front = 0
    else
      @front += 1
    end
    return data

  end

  def front
    # raise NotImplementedError, "Not yet implemented"
    return @store[@front]
  end

  def size
    # raise NotImplementedError, "Not yet implemented"
    return 0 if @front == -1
    return @front < @rear ? @rear - @front + 1 : MAX_SIZE - @front + @rear
  end

  def empty?
    # raise NotImplementedError, "Not yet implemented"
    return  @front == -1 
  end

  def to_s
    # return @store.to_s
    result = []
    MAX_SIZE.times do |i|
      index = ( i + @front) % MAX_SIZE
      result << @store[index] if @store[index]
    end
    return result.to_s
  end

end
