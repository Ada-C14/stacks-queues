class Queue

  MAX_SIZE = 20
  def initialize
    @queue = []
    @size = 20
    @front = -1 
    @rear = -1
    
  end

  def enqueue(element)

    if (@front == 0 && @rear == @size - 1) 
    raise "queue is full"
    elsif (@front == -1)
      @front = @rear = 0
      @queue[@rear] = element
    else
      @rear += 1
      @queue[@rear] = element
    end

  end

  def dequeue
    if (@front == -1) 
      raise "queue is empty"
    end
    
    result = @queue[@front]
    @queue[@front] = nil
  
    #if the queue is now empty
    if (@front == @rear)
      @front = -1
      @rear = -1
    elsif (@front == @size-1) 
      @front = 0
    else
      @front = @front + 1
    end
  
    return result
  end

  def front
    raise NotImplementedError, "Not yet implemented"
  end

  def size
    raise NotImplementedError, "Not yet implemented"
  end

  def empty?
    @front == -1
  end

  def to_s
    list = []
    index = @front
    while index <= @rear 
      list.push(@queue[index])
      index += 1
    end

    return list.to_s
  end
end
