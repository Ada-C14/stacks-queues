class Queue
  def initialize
    @store = Array.new(10)
    @front = @back = 0
  end

  def enqueue(element)
    # If circular buffer is full, make a new, bigger array
    if self.full?
      old_queue_size = @store.length
      new_store = Array.new(old_queue_size * 2)

      new_store_back = 0
      until @front == @back
        new_store[new_store_back] = dequeue
        new_store_back += 1
      end

      @store = new_store
      @front = 0
      @back = old_queue_size - 1
    end

    @store[@back] = element
    @back = (@back + 1) % @store.length
  end

  def dequeue
    # If the cicular queue is empty, raise error.
    if self.empty? # @back == @front
      raise Exception.new, "Cicular buffer is empty"
    end

    element = @store[@front]

    @store[@front] = nil

    buffer_size = @store.length

    @front = (@front + 1) % buffer_size

    return element
  end

  # Returns the item at the front, but leaves the Queue unchanged 
  # without directly accessing any methods of the Queue except `dequeue`, `enqueue` and `empty?`
  def front
    return nil if self.empty?

    element = self.dequeue

    self.enqueue(element)

    return element
  end

  def size
    buffer_size = @store.length

    if @front > @back
      return buffer_size - (@front - @back)
    else
      return @back - @front
    end
  end

  def empty?
    return @back == @front
  end

  def full?
    buffer_size = @store.length
    return @front == (@back + 1) % buffer_size
  end

  def to_s
    # return @store.to_s

    buffer_size = @store.length

    string = "["
    
    size.times do |i|
      element = @store[(@front + i) % buffer_size]
      string << "#{element}, "
    end

    string.slice!(-2,2)
    string << "]"

    puts string
    return string
  end
end
