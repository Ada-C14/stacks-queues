class Queue

  MAX_SIZE = 20

  def initialize
    @store = Array.new(MAX_SIZE)
    @front = @rear = -1
  end

  def enqueue(element)
    if (@front == 0 && @rear == MAX_SIZE - 1) || (@rear == (@front - 1) % (MAX_SIZE - 1))
      raise ArgumentError.new("The queue is full")
    elsif (@front == -1) && (@rear == -1)
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
    if @store.empty?
      raise ArgumentError.new("the Queue is empty")
    end
  
    data = @store[@front]

    @store[@front] = nil
    
    if (@front == @rear)
      @front == -1
      @rear == -1 
    elsif (@front == MAX_SIZE - 1) 
      @front = 0
    else 
      @front += 1
    end

    return data
  end

  def front
    return @store[@front]
  end

  def size
    if @rear >= @front
      return @rear - @front
    else
      MAX_SIZE - @front + @back
    end
  end

  def empty?
    return @front.nil? || @front == @rear
  end

  def to_s
    queue = []

    20.times do |i|
      index = (i + @front) % MAX_SIZE
      
      if @store[index]
        queue << @store[index]
      end
    end

    return queue.to_s
  end
end
