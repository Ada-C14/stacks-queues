class Queue
  MAX_SIZE = 20
  def initialize
    @list = Array.new(MAX_SIZE)
    @front = -1
    @back = -1
  end

  def enqueue(element)
    if (@back == MAX_SIZE - 1 && @front == 0) || (@back == (@front - 1) % (MAX_SIZE - 1))
      raise "queue is full"
    elsif @front == -1 #  queue is empty?
      @front = 0
      @back = 1 
      @list[@front] = element
    else
      @list[@back] = element
      @back = (@back + 1) % MAX_SIZE
    end

  end

  def dequeue

    if @front == -1
      raise "queue is empty"
    end

    data = @list[@front]

    if @front == @back  # if the queue is now empty
      @front = -1
      @back = -1
    else
      @front = (@front + 1) % MAX_SIZE
    end

    return data
  end

  def front
    return @list[@front]
  end

  def size
    return @front == -1 ? 0 : @back - @front + 1
  end

  def empty?
    return @front == -1 || @front == @back
  end

  def to_s
    if @front <= @back 
      return @list.slice(@front...@back).to_s 
    else
      return (@list.slice(@front...MAX_SIZE) + @list.slice(0...@back)).to_s
    end
  end
end
