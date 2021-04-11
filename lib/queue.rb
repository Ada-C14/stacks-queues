class Queue
  BUFFER = 20

  def initialize
    # @store = ...
    @queue = Array.new(BUFFER)
    @front = -1
    @rear = -1
  end

  def enqueue(element)
    if @front == 0 && @rear == BUFFER - 1 || @rear == (@front - 1)% (BUFFER - 1)
      raise ArgumentError.new("Full queue")
    elsif @front == -1
      @front = 0
      @rear = 0
    elsif @front !=0 && @rear == BUFFER - 1
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
    elsif @front == BUFFER - 1
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
    return 0 if @front == -1
    return @front < @rear ? @rear - @front + 1 : BUFFER - @front + @rear
  end

  def empty?
    @front == -1
  end

  def to_s
    result = []
    BUFFER.times do |i|
      index = (i + @front) % BUFFER
      result << @queue[index] if @queue[index]
    end
    return result.to_s
  end

end
