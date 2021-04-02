class Queue
  MAX_SIZE = 20
  
  def initialize
    @store = Array.new(MAX_SIZE)
    @front = @back = -1
  end

  def enqueue(element)
    if (@front == 0 && @back == MAX_SIZE - 1) || (@back == (@front - 1) % MAX_SIZE - 1)
      raise ArgumentError.new("The queue is full")
    elsif @front == -1 && @back == -1
      @front = 0
      @back = 0
    elsif @back == MAX_SIZE 
      @back = 0
    else
      @back += 1
    end
    @store[@back] = element
  end

  def dequeue
    raise ArgumentError, "Queue is empty" if @store.empty?

    result = @store[@front] 
    @store[@front] = nil
    if @front == @back
      @front = @back = -1
    elsif @front == MAX_SIZE - 1
      @front = 0
    else
      @front += 1
    end
    return result
  end

  def front
    @store[@front]
  end

  def size
    return MAX_SIZE if @front == @back % MAX_SIZE

    return @back > @front ? @back + 1 : MAX_SIZE - @front + @back
  end

  def empty?
    return @front == @back && @front == -1 ? true : false
  end

  def to_s
    return @store.select { |i| !i.nil? }.to_s
  end
end
