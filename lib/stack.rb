class Stack
  def initialize
    @store = LinkedList.new
  end

  def push(element)
    @store.add_first(element)
  end

  def pop
    return nil if self.empty?
    element = @store.remove_first
    return element
  end

  def empty?
    return @store.empty?
  end

  def to_s
    return @store.to_s
  end
end



#using array

class Stack
  SIZE = 20

  def initialize
    @store = Array.new(SIZE)
    @head = -1
  end

  def push(element)
    if @head < @store.length - 1
      @head += 1
      @store[@head] = element
    else
      # raise exception
    end
  end

  def pop
    if @head >= 0
      element = @store[@head]
      @head -= 1
      return element
    else
      # raise exception
    end
  end

  def empty?
    return @head < 0 
  end

  def to_s
    return @store.to_s
  end
end


