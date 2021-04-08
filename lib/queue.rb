class Queue

  attr_reader :head_ind, :tail_ind

  def initialize
    @max_size = 20 # max size of 20 per README
    @max_ind = @max_size - 1
    @store = Array.new(@max_size)
    @head_ind = @tail_ind = nil
  end

  def is_full?
    return !@head_ind.nil? && !@store[@head_ind].nil? && (@head_ind - @tail_ind == 1 || @head_ind - @tail_ind == -19)
  end

  def enqueue(element)
    raise ArgumentError, 'Queue is full' if is_full?

    if @tail_ind == @max_ind
      @tail_ind = 0
    elsif @tail_ind.nil?
      @tail_ind = 0
      @head_ind = 0
    else
      @tail_ind += 1
    end

    @store[@tail_ind] = element
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
    if @head_ind.nil?
      return true
    elsif @store[@head_ind].nil? && @store[@tail_ind].nil?
      return true
    end

    return false
  end

  def to_s
    temp = []
    @store.each { |it| temp << it unless it.nil? }

    return temp.to_s
  end
end
