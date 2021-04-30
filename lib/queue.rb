class Queue

  MAX_SIZE = 20

  def initialize
    @store = Array.new(MAX_SIZE)
    @front = -1
    @back = -1
  end

  def enqueue(element)
    if @front == 0 && @back == MAX_SIZE - 1 || @back == (@front - 1) % (MAX_SIZE - 1)
      raise ArgumentError
    elsif @front == -1
      @front = 0
      @back = 0
    elsif @back == MAX_SIZE - 1 && @front != 0
      @back = 0
    else
      @back += 1
    end
    @store[@back] = element
  end

  def dequeue
    return nil if @store.empty?
    raise ArgumentError if @front == -1
    element = @store[@front]
    @store[@front] = nil

    if @front == @back
      @front = -1
      @back = -1
    elsif @front == MAX_SIZE - 1
      @front = 0
    else
      @front += 1
    end
    return element
  end

  def front
    return @store[@front]
  end

  def size
    return 0 if @front == 1
    return @front < @back ? @back - @front + 1 : MAX_SIZE - @front + @back
  end

  def empty?
    @front == -1
  end

  def to_s
    result_array = []
    20.times do |i|
      index = (i + @front) % MAX_SIZE
      if @store[index]
        result_array << @store[index]
      end
    end
    return result_array.to_s
  end
end
