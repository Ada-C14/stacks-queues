require_relative './linked_list.rb'

class Stack
  def initialize
    @head = nil
  end

  def push(element)
    new_node = Node.new(element)
    new_node.next = @head

    @head.previous = new_node unless @head.nil?
    @head = new_node
    if @tail.nil?
      @tail = @head
    end
  end

  def pop
    raise ArgumentError, "Empty" if self.empty?

    value = @head.data
    @head = @head.next
    @head.previous = nil unless @head.nil?
    return value
  end

  def empty?
    if @head.nil?
      return true
    else
      return false
    end
  end

  def to_s
    return @store.to_s
  end
end
