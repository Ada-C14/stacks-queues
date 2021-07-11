class Queue

  SIZE = 20

  def initialize
    @store = Array.new(SIZE)
    @front = @back = -1
  end

  def enqueue(element)

    if @front == -1 && @back == -1
      @front = @back = 0
    elsif (@back + 1) % SIZE == @front
      raise ArgumentError.new("Queue is full")
    elsif @back == SIZE - 1
      @back = 0
    else
      @back += 1
    end

    @store[@back] = element
  end

  def dequeue
    raise ArgumentError, "Queue is empty" if @store.empty?

    result = @store[@front] 
    @store[@front] = nil
    if @front == @back
      @front = @back = -1
    elsif @front == SIZE - 1
      @front = 0
    else
      @front += 1
    end
    return result
  end

  def front
    return @store[@front]
  end

  def size
    return @store.select{|x| !x.nil?}.length
  end

  def empty?
    @store.map{|x| x.nil?}.all?
  end

  def to_s
    queue = []
    20.times do |i|
      index = (i + @front) % SIZE
      queue.push(@store[index]) if @store[index]
    end

    return queue.to_s
  end

end