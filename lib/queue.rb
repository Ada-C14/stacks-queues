class Queue

  def initialize
    @size = 20
    @store = Array.new(@size)
    @front = @back = -1
  end

  def enqueue(element)

    if (@front == 0 && @back == @size - 1) || (@back == ((@front - 1) % (@size - 1)))
      raise ArgumentError 'The Queue is full'
    elsif @front == - 1 # Queue is empty
      @front = @back = 0
      @store[@back] = element
    elsif (@back == @size - 1) && (@front != 0)
      @back = 0
      @store[@back] = element
    else
      @back += 1
      @store[@back] = element
    end
  end

  def dequeue
    raise ArgumentError 'Queue is empty' if @front == - 1

    element = @store[@front]
    @store[@front] = nil

    if @front == @back
      @front = @back = -1
    elsif @front == @size - 1
      @front = 0
    else
      @front += 1
    end
    return element
  end

  def front
    @store[@front]
  end

  def size
    count = if @back < @front
              @size - @front + @back + 1
            else
              @back - @front + 1
            end
    return count
  end

  def empty?
    return ((@front == - 1) && (@back == - 1))
  end

  def to_s
    if @front == -1 && @back == -1
      return '[]'
    elsif @front <= @back
      return @store[@front..@back].to_s
    else
      i = 0
      index = @front
      size = @size - @front + @back + 1
      result = []

      while i < size
        result << @store[index]
        if index < @size - 1
          index += 1
        else
          index = 0
        end
        i += 1
      end
      return result.to_s
    end
  end
end
