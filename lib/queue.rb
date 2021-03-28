class Queue
  MAX_BUFFER = 20 
  def initialize
    @store = Array.new(MAX_BUFFER)
    @front = -1
    @rear = -1
  end

  def enqueue(element)
    # check if queue if full 
    if @front == 0 && @rear == MAX_BUFFER - 1
      raise ArgumentError, "Queue is full, sorry"
    elsif @front == -1 # queue is empty 
      @front = @rear = 0 
      @store[@rear] = element
    elsif (@rear == MAX_BUFFER - 1 && @front != 0 ) # rear need to wrap
      @rear = 0 
      @store[@rear] = element
    else
      @rear = @rear + 1
      @store[@rear] = element
    end

  end

  def dequeue
    
    raise ArgumentError, "Queue is empty" if @front == -1

    data = @store[@front]
    # @store[@front] = nil

    # if the queue is now empty
    if @front == @rear 
      @front = @rear = -1
    elsif @front + 1 == MAX_BUFFER # front needs to wrap around
      @front = 0 
    else
      @front = @front + 1
    end

    return data


  end

  def front
    return @store[@front]
  end

  # TODO: look at this again
  def size
    return @store.length
  end

  def empty?
    return @front == -1
  end

  def to_s
    # return @store.to_s

    return "[]" if empty?
    arr = []
    current = @front 

    until current == @rear
      arr << @store[cur]
      current = (current + 1) % MAX_BUFFER
    end

    arr << @store[current]

    return arr.to_s
  end
end
