class Queue
  size = 20

  def initialize
    @store = Array.new(20)
    @front = -1
    @back = -1
  end

  def enqueue(element)
    if (@front == 0 && @back ==  size - 1) || (@back == (@front - 1) % size - 1)
      raise ArgumentError.new("The queue is full!")
      # queue is empty
    elsif @front == -1 && @back == -1
      @front = 0
      @back = 0
      # back needs to wrap around
    elsif @back == size
      @back = 0
    else
      @back = @back + 1

    end
    @store[@back] = element
  end

  def dequeue
    return nil if @store.empty?
    
    raise ArgumentError.new("queue is empty") if @front == -1
    data = @store[@front]
    @store[@front] = nil

    if @front == @back
      @front = -1
      @back = -1
    elsif @front == size - 1
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
    return @store.size
  end

  def empty?
    @front == @back
  end

  def to_s
    @store.filter { |i| !i.nil?}.to_s
  end
end
