class Queue

  attr_reader :front, :back

  def initialize
    @store = Array.new(20)
    # @store = Array.new(5)
    @front = @back = nil
  end

  def circular_buffer()
    # enqueue: back + 1
    # dequeue: front + 1

    # when back is > array.length
    # back should be 0
    # when front is > array.length
    # front should be zero

    # when back == front -> array is full

  end

  def enqueue(element)
    # p "back is #{@back}"
    # 1. set front and back to 0 if nil
    # 2. queue is full if front == back
    # 3. need to wrap back to 0 if at the end and there's space
    # 4. move back += 1

    # this confuses me and think missing logic?
    if @front.nil? && @back.nil?
      @front = @back = 0
    elsif @back % @store.length == @front
      raise ArgumentError.new("Queue is full")
    elsif @back == @store.length
      @back = 0
    end

    @store[@back] = element
    @back += 1



  end

  def dequeue
    # move front += 1
    # need to wrap back to 0 if at the end and there's space
    # raise error if empty
    # p "length #{@store.length}"
    # p @front
    # p @front == @store.length
    raise ArgumentError.new("Queue is empty") if @front.nil? && @back.nil?
    value = @store[@front]
    
    if @front == @store.length - 1
      @front = 0
    # else
    #   @front += 1
    end

    
    @store[@front] = nil
    @front += 1
    # p @front == @store.length
    # p @front
    # p @store.length
    # p @store
    # if @front == @store.length
    #   p "HUH"
    #   @front = 0
    # else
    #   @front += 1
    # end


    # @front += 1

    return value
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

    # # 1. set front and back to 0 if nil
    # # 2. queue is full if front == back
    # # 3. need to wrap back to 0 if at the end and there's space
    # # 4. move back += 1

    # # this confuses me and think missing logic?
    # if @front.nil? && @back.nil?
    #   @front = @back = 0
    # elsif (@back + 1) % @max_length == @front
    #   raise ArgumentError.new("Queue is full")
    # elsif @back == @max_length
    #   @back = 0
    # end

    # @store[@back] = element
    # @back += 1

# q = Queue.new
# q.enqueue(10)
# q.enqueue(20)
# q.enqueue(30)
# q.enqueue(40)
# q.enqueue(50)

# # [10, 20, 30, 40, 50]
# p q.to_s
# p q.front #0
# p q.back  #5

# q.dequeue
# # [nil, 20, 30, 40, 50]
# p q.to_s
# p q.front #1
# p q.back  #5

# q.enqueue(60)
# # [60, 20, 30, 40, 50]
# p q.to_s
# p q.front #1
# p q.back  #1

# q.dequeue
# # [60, nil, 30, 40, 50]
# p q.to_s
# p q.front  #2
# p q.back   #1

# q.dequeue
# # [60, nil, nil, 40, 50]
# p q.to_s
# p q.front  #3
# p q.back   #1

# q.dequeue
# # [60, nil, nil, nil, 50]
# p q.to_s
# p q.front  #4
# p q.back   #1

# q.dequeue
# # [60, nil, nil, nil, nil]
# p q.to_s
# p q.front  #0 or5?
# p q.back   #1

# q.dequeue
# # [nil, nil, nil, nil, nil]
# p q.to_s
# p q.front  #1
# p q.back   #1
# # isnt this wrong bc will say is full?

# q.enqueue(10)