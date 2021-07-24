class Queue

  def initialize
    @size = 20
    @store = Array.new
    @front = -1
    @rear = -1
  end

  def enqueue(element)
    if (@front == 0 && @rear == @size - 1) || (@rear == (@front - 1) % (@size-1))
      raise ArgumentError.new('Queue is full')
    elsif @front == -1 && @rear == -1
      @front = @rear = 0
    elsif @rear == @size - 1 && @front != 0
      @rear = 0
    else
      @rear = @rear + 1
    end

    @store[@rear] = element
  end

  def dequeue
    if @front == -1
      raise ArgumentError.new('Queue is empty')
    end

    data = @store[@front]
    @store[@front] = nil

    if @front == @rear
      @front = @rear = -1
    elsif @front == @size - 1
      @front = 0
    else
      @front = @front + 1
    end

    return data
  end

  def front
    return @store[@front]
  end

  def size
    return @back >= @front ? (@back - @front) : (@size - @front + @back)
  end

  def empty?
    return @front == -1
  end

  def to_s
    queue = []
    @size.times do |i|
      index = (i + @front) % @size
      queue << @store[index] if @store[index]
    end
    return queue.to_s
  end
end
