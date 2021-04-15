require_relative './linked_list.rb'

class Stack
  def initialize
    @store = LinkedList.new
    @head = nil
  end

  def push(element)
    @store.add_first(element)
  end

  def pop
    @store.remove_first
  end

  def empty?
    return @head.nil?
  end

  def to_s
    return @store.to_s
  end
end
