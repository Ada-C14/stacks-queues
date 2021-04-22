class Queue

  def initialize
    @store = Array.new(21)
    @front = -1
    @back = -1
    @size = 0
  end

  def enqueue(element)
    return nil if((@front == 0 && @back == @store.length - 1) || (@back == (@front - 1 ) % (@store.size - 1))) 
    @size += 1      
    if (@front == -1) 
      @front, @back = 0, 0
    elsif(@back == (@store.length - 1) && @front != 0) 
      @back = 0
    else
      @back += 1
    end
    @store[@back] = element
  end

  def dequeue

    return nil if @front == -1 

    data = @store[@front]

    @store[@front] = nil
  
    if (@front == @back)
      @front = -1
      @back = -1
    elsif (@front == @store.size - 1) 
      @front = 0
    else
      @front += 1
    end

    @size -= 1
    return data
    
  end

  def front
    return @front
  end

  def size
    return @size
  end

  def empty?
    return @size <= 0
  end

  def to_s
    return @store.compact.to_s
  end
end
