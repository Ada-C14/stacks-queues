class Queue

  MAX_SIZE = 20

  def initialize
    @store = Array.new
    @front = @back = -1
  end

  def enqueue(element)
    if (@front == 0 && @back == MAX_SIZE - 1) || (@back == (@front -1) % MAX_SIZE - 1)
      raise Exception.new("Queue is full")
    elsif @store.empty? # queue is empty
      @front = 0
      @back = 0
    elsif @back == (MAX_SIZE - 1) && @front != 0 # needs to wrap around
      @back = 0
    else # otherwise, ok to add
      @back += 1
    end

    @store[@back] = element # in any non exception case, add element to queue
  end

  def dequeue
    # removes and returns a value from the front of the queue
    # front index increases by one
    # add one then mod length of list bc when we pass the end itll bring us back to zero
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
    return 0 if @store.empty?

    return (@front - @back).abs + 1
  end

  def empty?
    return @front == @back
  end

  def to_s
    list = Array.new

    @store[@front...MAX_SIZE].each do |element|
      list.push(element) if element
    end

    if @back < @front # the queue has wrapped around
      @store[0..@back].each do |element|
        list.push(element) if element
      end
    end

    return list.to_s
  end
end
