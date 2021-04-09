class Queue
  def initialize
    @store = []
    @front = nil
    @back = nil
    @size = 20
  end

  def enqueue(element)
    if @front.nil? 
      @front = @back = 0
    elsif (@front - @back == 1) || (@back - @front == @size - 1)
      raise ArgumentError.new("Array is full") 
    end

    @store[@back] = element
    @back = (@back + 1) % @size
  end

  def dequeue
    if @front.nil? || @front == @back 
      raise ArgumentError.new("Array is empty")
    end

    temp = @store[@front]
    @front = (@front + 1) % @size
    return temp
  end

  def front
    return @store[@front]
  end

  def size
    return @back >= @front ? (@back - @front) : (@size - @front + @back)
  end

  def empty?
    return @front.nil? || @front == @back
  end

  def to_s
    temp = (@back >= @front) ? @store[@front...@back] : @store[@front...@size].concat(@store[0...@back])
    return temp.to_s
  end
end
