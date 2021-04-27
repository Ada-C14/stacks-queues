class Queue

  ARRAY_SIZE = 20 

  def initialize(size = 20)
    @store = Array.new(ARRAY_SIZE)
    @front = @back = 0 
  
  end

  def enqueue(element)
    
    # # Empty 
    # if @front == (@back +1 ) % @queue_size
    #   riase StandardError, ' Queue is now full'
    # else 
    #   @store[]
    #   @front = 0
    #   @back = 0 

    # #Full
    # elsif @front == @back
    #   length = @store.length
    #   new_array = Array.new(length  * 2)
     
    #   write = 0
    #   read = @front

    #   while 
  end

  def dequeue
    raise NotImplementedError, "Not yet implemented"
  end

  def front
    return @store[@front]
  end

  def size
    raise NotImplementedError, "Not yet implemented"
  end

  def empty?
    return @front == @back
  end

  def to_s
    return @store.to_s
  end
end
