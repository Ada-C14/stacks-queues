class Queue
  MAX_SIZE = 20

  def initialize
    # @store = ...
    @store = Array.new
    @front = @back = -1
  end

  def enqueue(element)
    if (@front == 0 && @back == MAX_SIZE - 1) || (@back == (@front -1) % MAX_SIZE - 1)
      raise Exception.new("Queue is full.")
    elsif @store.empty? 
      @front = 0
      @back = 0
    elsif @back == (MAX_SIZE - 1) && @front != 0
      @back = 0
    else 
      @back += 1
    end

    @store[@back] = element # in any non exception case, add element to queue
  end

  def dequeue
    # raise StandardError.new if @front == @back

    raise Exception.new("Queue is empty") if @store.empty?

    num_to_dequeue = @store[@front] # save the num to dequeue
    @store[@front] = nil # overwrite element to delete

    if @front == @back # queue is now empty
      @front = @back = -1
    elsif @front + 1 == MAX_SIZE
      @front = 0
    else # otherwise, add to front
      @front += 1
    end

    return num_to_dequeue
  end

  def front
    return @store[@front]
  end

  def size
    return 0 if @front == -1
    return @front < @rear ? @rear - @front + 1 : MAX_SIZE - @front + @rear
  end

  def empty?
    return @front == @back
  end

  def to_s
    list = Array.new

    @store[@front...MAX_SIZE].each do |item|
      list.push(item) if item
    end

    if @back < @front # the queue has wrapped around
      @store[0..@back].each do |item|
        list.push(item) if item
      end
    end

    return list.to_s
  end
end
