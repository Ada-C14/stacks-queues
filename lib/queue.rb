class Queue

  attr_reader :front, :back

  def initialize
    @store = Array.new(20)
    # @store = Array.new(5)
    @front = @back = -1
  end

  def enqueue(element)
    p "back is #{@back}"
    p "length #{@store.length}"
    # 1. set front and back to 0 if nil
    # 2. queue is full if front == back
    # 3. need to wrap back to 0 if at the end and there's space
    # 4. move back += 1

    if @front == -1 && @back == -1
      @front = @back = 0
    elsif (@back + 1) % @store.length == @front
      raise ArgumentError.new("Queue is full")
      # passes if get rid of -1
    elsif @back == @store.length
      @back = 0
    else
      @back += 1
    end

    @store[@back] = element

    # if (@back + 1) % @store.length == @front
    #   raise ArgumentError.new("The queue is full")
    # elsif @front == -1 && @back == -1
    #   @front = 0
    #   @back = 0
    # elsif @back == MAX_SIZE - 1 && front != 0 
    #   @back = 0
    # else
    #   @back += 1
    # end
    # @store[@back] = element



  end

  def dequeue

    # if @front == -1
    #   raise ArgumentError.new("Queue is empty")
    # end
    
    # data = @store[@front]
    # # overwrite the element being deleted
    # @store[@front] = nil
  
    # # if the queue is now empty
    # if (@front == @back)
    #   @front = -1
    #   @back = -1
    # elsif @front == @store.length - 1
    #   #  // if front needs to wrap around
    #   @front = 0
    # else
    #   @front = @front + 1
    # end
  
    # return data



    raise ArgumentError, "Queue is empty" if @store.empty?

    result = @store[@front] 
    @store[@front] = nil
    if @front == @back #why - queue is empty?
      @front = @back = -1
    elsif @front == @store.length - 1 # why - front needs to wrap around?
      @front = 0
    else
      @front += 1
    end
    return result
  end

  # def front
  #   raise NotImplementedError, "Not yet implemented"
  # end

  def size
    raise NotImplementedError, "Not yet implemented"
  end

  def empty?
    @store.map{|x| x.nil?}.all?
  end

  def to_s
    # return @store.to_s
    return @store.select{|x| !x.nil?}.to_s
  end


end


q = Queue.new
q.enqueue(10)
p q.to_s
p q.back 
q.enqueue(20)
p q.back 
q.enqueue(30)
p q.back 
p q.to_s
q.enqueue(40)
p q.to_s
q.enqueue(50)

# [10, 20, 30, 40, 50]
p q.to_s
p q.front #0
p q.back  #5 -> 4

q.dequeue
# [nil, 20, 30, 40, 50]
p q.to_s
p q.front #1
p q.back  #5 -> 4

q.enqueue(60)
# [60, 20, 30, 40, 50] -> [20, 30, 40, 50, 60]
p q.to_s
p q.front #1
p q.back  #1  -> 5

q.dequeue
# [60, nil, 30, 40, 50]
p q.to_s
p q.front  #2
p q.back   #1 -> 5

q.dequeue
# [60, nil, nil, 40, 50]
p q.to_s
p q.front  #3
p q.back   #1 -> 5

q.dequeue
# [60, nil, nil, nil, 50]
p q.to_s
p q.front  #4
p q.back   #1 -> 5

q.enqueue(70)
# [60, 20, 30, 40, 50] -> [20, 30, 40, 50, 60]
p q.to_s
p q.front # 4
p q.back  # 6

q.enqueue(80)
# [60, 20, 30, 40, 50] -> [20, 30, 40, 50, 60]
p q.to_s
p q.front # 4
p q.back  # 7

q.enqueue(90)
# [60, 20, 30, 40, 50] -> [20, 30, 40, 50, 60]
p q.to_s
p q.front # 4
p q.back  # 6

q.dequeue
# [60, nil, nil, nil, nil]
p q.to_s
p q.front  #0 -> 5
p q.back   #1

q.dequeue
# [nil, nil, nil, nil, nil]
p q.to_s
p q.front  #1 -> -1
p q.back   #1 -> -1

q.enqueue(10)
p q.to_s
q.enqueue(10)
p q.to_s
q.enqueue(10)
p q.to_s
q.enqueue(10)
p q.to_s
q.enqueue(10)
p q.to_s
q.enqueue(10)
p q.to_s
q.enqueue(10)
p q.to_s
q.enqueue(10)
p q.to_s
q.enqueue(10)
p q.to_s
q.enqueue(10)
p q.to_s
q.enqueue(10)
p q.to_s
q.enqueue(10)
p q.to_s
q.enqueue(10)
p q.to_s