class Queue

    MAX_SIZE = 20

  def initialize
    @store = Array.new
    @head = @tail = 0
  end

  # add value to tail
  def enqueue(element)
    # using mod to account for cicular increment 20 % 20 = 0
    # check if queue is full
    raise ArgumentError.new("Queue is full, cannot add element") if @head == (@tail + 1) % MAX_SIZE
    # otherwise add element as tail value

    @store[@tail] = element
    @tail = (@tail + 1) % MAX_SIZE

    return @store
  end

  def dequeue
    raise ArgumentError.new("Queue is empty, cannot delete element") if @head == @tail

    removed_element = @store[@head]
    # @store[@head] = nil
    # @store = @store.compact
    @head = (@head + 1) % MAX_SIZE

    return removed_element
  end

  def front
    return @store[@head]
  end

  def size
    return 0
  end

  def empty?
    return @head == @tail
  end

  def to_s
  # TODO: refactor dequeue to not have to have this conditional
  # has to do with removing nil which affects the index. This is P2. P1: Graduate!
  if @tail >= @head 
    @store = @store[@head...@tail]
  else
    @store = @store[@head...MAX_SIZE] + (@store[0...@tail])
  end
    return @store.to_s
  end
end
