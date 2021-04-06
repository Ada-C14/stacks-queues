class Queue
  BUFFER_SIZE = 20

  def initialize
    @queue = Array.new(BUFFER_SIZE)
    @front = -1
    @rear = -1
  end

  def enqueue(element)
    if @front == 0 && @rear == BUFFER_SIZE - 1 || @rear == (@front - 1) % (BUFFER_SIZE - 1)
      raise ArgumentError.new("The queue is full!")
    elsif @front == -1 #queue is empty
      @front = 0
      @rear = 0
    elsif @rear == BUFFER_SIZE - 1 && @front != 0 #rear needs to wrap around
      @rear = 0
    else
      @rear += 1
    end
    @queue[@rear] = element
  end

  def dequeue
    return nil if @queue.empty?
    raise ArgumentError.new("Nothing to dequeue") if @front == -1
    data = @queue[@front]
    @queue[@front] = nil

    if @front == @rear
      @front = -1
      @rear = -1
    elsif @front == BUFFER_SIZE - 1
      @front = 0
    else
      @front += 1
    end
    return data
  end

  def front
    return @queue[@front]
  end

  def size
    @front == -1 ? 0 : (@front - @rear).abs + 1
  end

  def empty?
    @front == -1
  end

  def to_s
    result = []
    20.times do |i|
      index = (i + @front) % BUFFER_SIZE
      result << @queue[index] if @queue[index]
    end
    return result.to_s
  end
end
