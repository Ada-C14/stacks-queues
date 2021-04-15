class Queue

  def initialize
    @store = Array.new(20)
    @start = 0
    # @end = 0
    @size = 0
  end

  def enqueue(element)
    if size < 20
      @store[(@start + @size) % 20] = element
      @size += 1
    end
  end

  def dequeue
    if @size != 0
      element = @store[@start] 
      @start = (@start + 1 ) % 20
      @size -= 1
      return element
    end
  end

  def front
    return @store[@start]
  end

  def size
    return @size
  end

  def empty?
    return @size == 0
  end

  def to_s
    output = []
    i = @start
    while i < @size + @start
      output << @store[i % 20]
      i += 1
    end


    return output.to_s
  end
end
