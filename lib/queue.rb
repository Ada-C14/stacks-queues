class Queue
  Array_Length = 20

  def initialize
    @store = Array.new(Array_Length)
    @front = @back = 0 # back is the LAST EMPTY Space at the end
  end

  def enqueue(element)
    if @front.nil? 
      @front = @back = 0
    elsif @front - @back == 1 || (@back - @front == Array_Length - 1) # edge case were @back and @front are in different sides of the circle
      raise ArgumentError, 'Queue is full' 
    end

    @store[@back] = element
    @back = (@back + 1) % Array_Length # to update the back

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
    return 0 if @front.nil?
    if @front < @back
      @back - @front
    else
      Array_Length - (@front + @back)
    end
  end

  def empty?
    if @front.nil? || @front == @back
      return true
    else
      return false
    end
  end

  def to_s
    results = []
    if @back >= @front 
      results = @store[@front...@back]
    else
      # from beginig to end of the list + begining to @back
      results = @store[@front...Array_Length] + (@store[0...@back]) 
    end
    return results.to_s
  end


end
