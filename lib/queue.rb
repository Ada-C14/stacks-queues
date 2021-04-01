class Queue
  def initialize
    @store = []
    @head_ind = @tail_ind = 0
    @max_ind = 19
  end

  def enqueue(element)
    raise ArgumentError, 'Queue is full' if @tail_ind - @head_ind > @max_ind

    @store << element
    if @tail_ind == @max_ind
      @tail_ind = 0
    else
      @tail_ind += 1
    end

    return element
  end

  def dequeue
    raise ArgumentError, 'Queue is empty' if @store.empty?

    removed = @store[@head_ind]
    @store[@head_ind] = nil
    if @head_ind == @max_ind
      @head_ind = 0
    else
      @head_ind += 1
    end

    return removed
  end

  def front
    raise NotImplementedError, "Not yet implemented"
  end

  def size
    raise NotImplementedError, "Not yet implemented"
  end

  def empty?
    raise NotImplementedError, "Not yet implemented"
  end

  def to_s
    temp = []
    @store.each { |it| temp << it unless it.nil? }
    
    return temp.to_s
  end
end
