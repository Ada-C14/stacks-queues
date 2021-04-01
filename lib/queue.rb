class Queue
  def initialize
    @store = []
    @head_ind = @tail_ind = 0
    @max_ind = 19 # max size of 20 per README
  end

  def enqueue(element)
    raise ArgumentError, 'Queue is full' if @tail_ind - @head_ind > @max_ind

    @store << element
    if @tail_ind == @max_ind
      @tail_ind = 0
    elsif @store[@tail_ind + 1] # we want @tail_ind to remain at 0 when adding first element to queue
      @tail_ind += 1
    end

    return element
  end

  def dequeue
    raise ArgumentError, 'Queue is empty' if empty?

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
    raise ArgumentError, 'Queue is empty' if empty?

    return @store[@head_ind]
  end

  def size
    return 0 if empty?

    return (@head_ind - @tail_ind).abs + 1
  end

  def empty?
    return @store[@head_ind].nil?
  end

  def to_s
    temp = []
    @store.each { |it| temp << it unless it.nil? }
    
    return temp.to_s
  end
end
