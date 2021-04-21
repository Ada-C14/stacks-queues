class Queue
  Array_Length = 20

  def initialize
    @store = Array.new(Array_Length)
    @front = @back = 0
  end

  def enqueue(element)
    if @front.nil? 
      @front = @back = 0
    elsif (@front - @back == 1) || (@back - @front == Array_Length - 1)
      raise ArgumentError, 'Queue is full' 
    end

    @store[@back] = element
    @back = (@back + 1) % Array_Length
  end

  def dequeue
    if @front == @back || @front.nil?
      raise ArgumentError, 'Queue is empty'
    end

    temp = @store[@front]
    @front = (@front + 1) % Array_Length
    return temp
  end

  def front
    return @store[@front]
  end

  def size
    return 0 if @front == -1
    if @front < @back
      @back - @front + 1
    else
      Array_Length - @front + @back
    end
  end

  def empty?
    return @front.nil? || @front == @back
  end

  def to_s
    results = []
    if @back >= @front 
      results = @store[@front...@back]
    else
      results = @store[@front...Array_Length] + (@store[0...@back])
    end
    return results.to_s
  end
  
end
