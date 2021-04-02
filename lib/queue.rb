class Queue

  MAX_BUFFER = 20 # max items in queue at a given time

  # Time Complexity: O(1), always initializing constant elements
  # Space Complexity: O(1), always initializing same number of elements
  def initialize
    @store = Array.new(MAX_BUFFER, nil) # circular buffer
    @front = @back = -1 # track index of front/back
  end

  # Time Complexity: O(1), you don't have to check all elements of the array, just the front/back
  # Space Complexity: O(1), always initializing a certain range of variables regardless of size of array.
  # The max buffer means that you can never have more than 20 elements, and you are at most adding one element
  # to the array until you reach a certain size. At that point, you are only overwriting an element based on tracking
  # the front and back.
  def enqueue(element)
    # check if queue is full 
    raise ArgumentError, "Queue is full" if (@back + 1) % MAX_BUFFER == @front 
    # check if queue is empty
    # empty queue
    if @front < 0
      @front = @back = 0
    # overflow to wrap around
    elsif @back == MAX_BUFFER - 1 # raise block will check for a full queue
      @back = 0
      @store[@back] = element
    # okay to just add
    else 
      @back += 1
    end 
    @store[@back] = element
  end

  # Time Complexity: O(1), you don't have to check all elements of the array, just the front/back
  # Space Complexity: O(1), you aren't adding or deleting space since the array is always the same size,
  # all that's being done is moving what index front/back should check, meaning any variables initialized
  # don't depend on the size of the queue itself. 
  def dequeue
    # check if queue is empty 
    raise ArgumentError, "Queue is empty" if self.empty? 
    
    element = @store[@front]
    
    # check last element removed
    if (@front == @back)
      @front = @back = -1 
    elsif @front + 1 == MAX_BUFFER
      @front = 0
    # nominal case
    else
      @front += 1
    end

    return element
  end
  # Time Complexity: O(1), always retrieving a single value at index defined by @front
  # Space Complexity: O(1), only retrieving value at index defined by @front
  def front
    return @store[@front]
  end

  def size
    return MAX_BUFFER if (@back + 1) % MAX_BUFFER == @front
    
    return @front < @back ? @back - @front + 1 : @back + MAX_BUFFER + 1 - @front 
  end

  # Time Complexity: O(1), only retrieving a state by checking a single value at index defined by @front
  # Space Complexity: O(1), only retrieving a state at index defined by @front
  def empty?
    return @front == -1
  end

  # Time Complexity: O(n), you have to check every element in the stack as defined by @front/back in order to
  # add them to the string version of the return array. the return array converting to a string is also an O(n)
  # operation, I think, but doesn't increase big O of the function and is just much cleaner to implement (unlike 
  # delete in the BST)
  # Space Complexity: O(n), creating a array whose size/num elements depends on num elements currently in 
  # queue as defined by @front/@back
  def to_s
    return "[]" if empty?
    arr = []
    cur = @front 

    until cur == @back
      arr << @store[cur]

      cur = (cur + 1) % MAX_BUFFER
    end

    arr << @store[cur]

    return arr.to_s
  end
end
