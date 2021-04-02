require_relative './linked_list.rb'

class Stack
  # Time Complexity: O(1) to initialize variable
  # Space Complexity: O(1) for creating LinkedList object
  def initialize
    @store = LinkedList.new
  end

  # Time Complexity: O(1), as add_first of LinkedList is O(1) to add an element.
  # Space Complexity: O(1) as LinkedList used, does not shift elements and only adds one element at top 
  def push(element)
    # add element to the head of @store
    @store.add_first(element)
  end

  # Time Complexity: O(1), as remove_first of LinkedList is O(1) to remove an element.
  # Space Complexity: O(1) as LinkedList used, does not shift elements and only removes first element
  def pop
    # assume head of @store is top of stack
    return @store.remove_first()
  end

  # Time Complexity: O(1), only need to check if first element is empty, meaning rest of stack is empty
  # Space Complexity: O(1) as no new space created, existing space is just examined for a certain state
  def empty?
    # encase the LinkedList method for this 
    return @store.empty?
  end

  # Time Complexity: O(n), need to find every element of stack in order to print every element
  # Space Complexity: O(n) to store info of every element in stack as a new array element in return array

  def to_s
    return @store.to_s
  end
end
