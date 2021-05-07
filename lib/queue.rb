class Queue

  def initialize
    @store = Array.new()
    @max = 20
    @front = 0
    @back = 0
  end

  def enqueue(element)
    if @back == @front-1 || (@front == 0 && @back == @max - 1)
      # account for full Queue
      return raise ArgumentError.new("Queue is full")
    elsif self.empty?
      @front = 0
      @back = 0
    elsif @back == @max-1
      @back = 0 # if last then circles around
    else 
      @back = @back + 1 # incr by 1
    end
    @store[@back] = element

  end

  def dequeue
    if self.empty?
      raise ArgumentError.new("Queue's Empty") 
    end

    value = @store[@front]
    @store[@front] = nil

    if @front == @max - 1 # circle
      @front = 0
    else
      @front = @front + 1
    end
    return value
  end

  def front
    return @store[@front]
  end

  def size
    return 0 if @front == -1
    if @front < @back
      @back - @front + 1
    else
      @max - (@back - @front)
    end
  end

  def empty?
    # return @front == -1
    return @store.all?{ |e| e.nil? }
  end

  def to_s
    list = []
    index = @front
    until index == @back + 1 
      list << @store[index]
      index = (index + 1) % @max
    end
    return list.to_s
  end
end