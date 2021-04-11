MAX_SIZE = 20

class Queue

  def initialize
    @store = Array.new(MAX_SIZE)
    @front = -1
    @back = -1 
  end

  def enqueue(element)
    if (@front == 0 && @back == MAX_SIZE - 1) || (@back == (@front - 1) % MAX_SIZE - 1)
      raise StandardError.new "Queue is full!" 
    elsif @front == -1 && @back == -1 # Queue is empty
      @front = 0
      @back = 0
    elsif @back == MAX_SIZE # rear needs to wrap around
      @back = 0
    else
      @back += 1
    end

    @store[@back] = element
  end

  def dequeue
    raise StandardError.new "Queue is empty!" if @store.empty?
    
    deleted = @store[@front]
    @store[@front] = nil # overwrite the element being deleted
  
    if (@front == @back) # if the queue is now empty
      @front = -1
      @back = -1
    elsif (@front == MAX_SIZE - 1) # if front needs to wrap around
      @front = 0
    else
      @front += 1
    end
  
    return deleted
  end

  def front
    return @store[@front]
  end

  def size
    return @store.compact.to_i
  end

  def empty?
    @front == -1 && @back == -1 ? true : false
  end

  def to_s
    return @store.compact.to_s # .compact returns array minus nil values
  end
end
