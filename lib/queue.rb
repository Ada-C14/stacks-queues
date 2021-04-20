class Queue

  attr_accessor :start, :size, :start, :end

  def initialize(size=20)
    @store = Array.new(size)
    @size = size
    @start, @end = -1, -1
  end

  def full?
    (@end + 1) % @size == @start
  end

  def enqueue(element)
    # raise ArgumentError.new("Queue full") if self.full?

    if self.empty?
      @start = 0
      @end = 1
      @store[@start] = element
    elsif @start == @end
      raise ArgumentError.new("Queue full!")
    else
      @store[@end] = element
      @end = (@end + 1) % @size
    end
  end

  def dequeue
    if @start == -1
      raise ArgumentError.new("Queue empty")
    else
      element = @store[@start]
      @start = (@start + 1) % @size
      if @start == @end
        @start, @end = -1 
      end
    end
    return element
  end

  def front
    raise ArgumentError.new("Queue empty") if @start == -1
    @start
  end

  def size
    @size
  end

  def empty?
    return @start == -1
  end

  def to_s
    arr = []
    current = @start
    while current != @end
      arr << @store[current]
      current = (current+1) % size
    end
    return arr.to_s
  end
end
