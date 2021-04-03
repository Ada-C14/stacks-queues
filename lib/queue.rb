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
    # elsif @back == @store.length
    #   @back = 0
    end

    @store[@back] = element
    @back += 1



  end

  def dequeue
    # move front += 1
    # need to wrap back to 0 if at the end and there's space
    # raise error if empty
    raise ArgumentError.new("Queue is empty") if @front.nil? && @back.nil?

    value = @store[@front]

    @store[@front] = nil
    @front += 1



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

q = Queue.new
q.enqueue(10)
q.enqueue(20)
q.enqueue(30)
q.enqueue(40)
q.enqueue(50)

p q.to_s
p q.front
p q.back

q.dequeue
p q.to_s
p q.front
p q.back

q.enqueue(60)
p q.to_s
p q.front
p q.back

q.dequeue
p q.to_s
p q.front
p q.back