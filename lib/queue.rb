class Queue

  def initialize
    @store = Array.new(10)
    @front = @back = 0
  end

  def enqueue(element)
    # If circular buffer is full, make a new, bigger array
    if @front == (@back + 1) % size
      old_queue_size = @store.length
      new_store = Array.new(old_queue_size + 10)

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
    @back = (@back + 1) % size
  end

  def dequeue
    # If the cicular queue is empty, raise error.
    if self.empty? # @back == @front
      raise Exception.new, "Cicular buffer is empty"
    end

    element = @store[@front]

    @store[@front] = nil
    @front = (@front + 1) % size

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
    return @store.length
  end

  def empty?
    return @back == @front
  end

  def to_s
    # return @store.to_s

    string = "["

    @store.each do |element|
      if element
        string << "#{element}, "
      end
    end

    string.slice!(-2,2)
    string << "]"

    return string
  end
end
