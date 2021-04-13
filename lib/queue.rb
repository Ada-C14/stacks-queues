class Queue

MAX_SIZE = 20

  def initialize
    # @store = ...
    # raise NotImplementedError, "Not yet implemented"
    
    @store = Array.new(MAX_SIZE)
    @front = -1 
    @back = -1
  end

  def enqueue(element)
    # raise NotImplementedError, "Not yet implemented"
    
    if (@front == 0 && @back == MAX_SIZE - 1) || (@back == (@front - 1) % MAX_SIZE - 1)
      raise ArgumentError.new, "Queue is full"
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
    # raise NotImplementedError, "Not yet implemented"
    
    if @store.empty?
      raise ArgumentError.new, "Queue is empty"
    end
  
    data = @store[@front]
    @store[@front] = nil 
    
  
    if (@front == @back)
      @front == -1
      @back == -1 
    elsif (@front == MAX_SIZE - 1) 
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
    return @store.compact.length
  end

  def empty?
    # raise NotImplementedError, "Not yet implemented"
    return @store.compact.length == 0 ? true : false
  end

  def to_s
    return @store.compact.to_s
  end
end
