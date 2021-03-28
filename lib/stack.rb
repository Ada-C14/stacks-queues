class Stack
  def initialize
    @store = LinkedList.new
  end

  def push(element)
    return @store.add_first(element)
  end

  def pop
    return nil if self.empty?
    
    return @store.remove_first
  end

  def empty?
    @store.empty?
  end

  def to_s
    return @store.to_s
  end
end
