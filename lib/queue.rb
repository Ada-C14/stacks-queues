class Queue

  MAX_SIZE = 20

  def initialize
    @store = Array.new(MAX_SIZE)
    @head = @tail = 0
    @size = 0
  end

  def enqueue(element)
    if @size == MAX_SIZE
      raise StandardError, "Queue already reached its max size."
    end
    @store[@tail] = element
    @tail = (@tail + 1) % MAX_SIZE
    @size += 1
  end

  def dequeue
    result = front
    @store[@head] = nil
    @head = (@head + 1) % MAX_SIZE
    @size -= 1
    return result
  end

  def front
    if empty?
      raise StandardError, "Queue is empty."
    end
    return @store[@head]
  end

  def size
    return @size
  end

  def empty?
    return @size == 0
  end

  def to_s
    if empty?
      return ""
    elsif @head < @tail
      return @store[@head...@tail].to_s
    else
      return @store[@head..].concat(@store[0...@tail]).to_s
    end
  end
end
