class Queue

  MAX_SIZE = 20
  # attr_reader :front, :back

  def initialize
    @store = Array.new(20)
    # @store = Array.new(5)
    # @front = @back = nil
    @front = @back = -1
  end

  def enqueue(element)
    p "back is #{@back}"
    # 1. set front and back to 0 if nil
    # 2. queue is full if front == back
    # 3. need to wrap back to 0 if at the end and there's space
    # 4. move back += 1

    if @front == -1 && @back == -1
      @front = @back = 0
    # elsif @back == @front 
    elsif (@back + 1) % @store.length == @front
      raise ArgumentError.new("Queue is full")
    elsif @back == @store.length
      @back = 0
    else
      @back += 1

    end

    @store[@back] = element
    # @back += 1

    # if (@front == 0 && @back == MAX_SIZE - 1) || (@back == (@front - 1) % MAX_SIZE - 1)
    #   raise ArgumentError.new("The queue is full")
    # elsif @front == -1 && @back == -1
    #   @front = 0
    #   @back = 0
    # elsif @back == MAX_SIZE
    #   @back = 0
    # else
    #   @back += 1
    # end
    # @store[@back] = element



  end

  def dequeue
    # move front += 1
    # need to wrap back to 0 if at the end and there's space
    # raise error if empty

    # raise ArgumentError.new("Queue is empty") if @front.nil? && @back.nil?
    # value = @store[@front]
    
    # if @front == @store.length - 1
    #   @front = 0
    # # else
    # #   @front += 1
    # end

    # @store[@front] = nil
    # @front += 1
  
    # return value

    raise ArgumentError, "Queue is empty" if @store.empty?

    result = @store[@front] 
    @store[@front] = nil
    if @front == @back
      @front = @back = -1
    elsif @front == MAX_SIZE - 1
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
    return @store.select{|x| !x.nil?}.to_s
  end


end


# q = Queue.new
# q.enqueue(10)
# p q.back 
# q.enqueue(20)
# p q.back 
# q.enqueue(30)
# p q.back 
# q.enqueue(40)
# q.enqueue(50)

# # [10, 20, 30, 40, 50]
# p q.to_s
# p q.front #0
# p q.back  #5 -> 4

# q.dequeue
# # [nil, 20, 30, 40, 50]
# p q.to_s
# p q.front #1
# p q.back  #5 -> 4

# q.enqueue(60)
# # [60, 20, 30, 40, 50] -> [20, 30, 40, 50, 60]
# p q.to_s
# p q.front #1
# p q.back  #1  -> 5

# q.dequeue
# # [60, nil, 30, 40, 50]
# p q.to_s
# p q.front  #2
# p q.back   #1 -> 5

# q.dequeue
# # [60, nil, nil, 40, 50]
# p q.to_s
# p q.front  #3
# p q.back   #1 -> 5

# q.dequeue
# # [60, nil, nil, nil, 50]
# p q.to_s
# p q.front  #4
# p q.back   #1 -> 5

# q.dequeue
# # [60, nil, nil, nil, nil]
# p q.to_s
# p q.front  #0 -> 5
# p q.back   #1

# q.dequeue
# # [nil, nil, nil, nil, nil]
# p q.to_s
# p q.front  #1 -> -1
# p q.back   #1 -> -1

# q.enqueue(10)