class Queue
  MAX_SIZE = 20

  def initialize
    @store = Array.new
    @front = -1
    @back = -1
  end

  def enqueue(element)
    if @front == 0 && @back == MAX_SIZE - 1 || @back == @front - 1 % MAX_SIZE - 1
      raise ArgumentError
    elsif @store.empty? 
      @front = 0
      @back = 0
    elsif @back == MAX_SIZE - 1 && @front != 0
      @back = 0
    else 
      @back += 1
    end

    @store[@back] = element
  end

  def dequeue
    if @store.empty?
      raise ArgumentError
    end

    removed_num = @store[@front]
    @store[@front] = nil

    if @front == @back
      @front = -1
      @back = -1
    elsif @front + 1 == MAX_SIZE
      @front = 0
    else
      @front += 1
    end

    return removed_num
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

    if @back < @front
      @store[0..@back].each do |item|
        list.push(item) if item
      end
    end

    return list.to_s
  end
end
