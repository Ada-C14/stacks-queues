class Node
  attr_reader :data 
  attr_accessor :next, :previous 

  def initialize(value, next_node = nil, previous_node = nil)
    @data = value
    @next = next_node
    @previous = previous_node
  end
end

class LinkedList
    def initialize
      @head = nil
      @tail = nil
    end

    # Time Complexity: O(1)
    # Space Complexity O(1)
    def add_first(value)
      new_node = Node.new(value)
      new_node.next = @head

      @head.previous = new_node unless @head.nil?
      @head = new_node
      if @tail.nil?
        @tail = @head
      end
    end

    def remove_first()
      raise ArgumentError, "Empty" if self.empty?

      value = @head.data
      @head = @head.next
      @head.previous = nil unless @head.nil?
      return value
    end

    def empty?
      return @head.nil?
    end

    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def search(value)
      return false if @head.nil?
      return true if @head.data = value
      current = @head
      until current.data.nil?
        return true if current.data = value
        current = current.next
      end
    end

    # Time Complexity:  O(n)
    # Space Complexity: O(1)
    def find_max
      return nil if @head.nil?
      current = @head
      max = current.data
      until current.nil?
        max = current.data if current.data > max
        current = current.next
      end
      return max
    end

    # Time Complexity:  O(n)
    # Space Complexity: O(1)
    def find_min
      return nil if @head.nil?
      current = @head
      min = current.data
      until current.nil?
        if current.data < min
          min = current.data 
        end
        current = current.next
      end
      return min
    end

    # Time Complexity:  O(n)
    # Space Complexity: O(1)
    def length
      return 0 if @head.nil?
      length = 0
      current = @head
      until current.nil?
        current = current.next
        length += 1
      end
      return length
      
    end

    # Time Complexity:  O(n)
    # Space Complexity: O(1)
    def get_at_index(index)
      return nil if length <= index
      current = @head
      count = 0
      until current.nil?
        return current.data if count == index
        current = current.next
        count += 1
      end
    end

    # Time Complexity:  O(n)
    # Space Complexity: O(1)
    def visit
      current = @head
      until current.nil?
        puts current.data
        current = current.next
      end
    end

    # Space Complexity: O(1)
    def delete(value)
      return if @head.nil?
      current = @head

      if current.data == value
        @head = current.next
        @head.previous = nil unless @head.nil?
        return
      end

      prev = current
      until current.nil?
        if current.data == value
          prev.next = current.next
          current.next.previous = prev unless current.next.nil?
          @tail = prev if @tail == current
        else
          prev = current
        end
        current = current.next
      end
    end

    # Time Complexity:  O(n)
    # Space Complexity: O(1)
    def reverse
      return nil if @head.nil?
      prev = nil
      current = @head
      until current.nil?
        temp = current.next
        current.next = prev
        prev = current
        current = temp
        prev.previous = current

      end

      @head = prev

    end

    # Time Complexity:  O(n)
    # Space Complexity: O(1)
    def find_middle_value
      return nil if @head.nil?
      current = @head
      if length % 2 == 0
        return nil
      else
        middle_index = length / 2
      end
      index = 0
      until current.nil?
        return current.data if index == middle_index
        current = current.next
        index += 1
      end

    end

    # Time Complexity:  O(n)
    # Space Complexity: O(1)
    def find_nth_from_end(n)
      return nil if @head.nil?
      current = @head
      index = 0
      until current.nil?
        if index == length - n - 1
          return current.data
        end
        index += 1
        current = current.next
      end
    end

    # Time Complexity:  O(n)
    # Space Complexity: O(1)
    def has_cycle
      return nil if @head.nil?
      slow_p = @head
      fast_p = @head
      while slow_p != nil && fast_p != nil and fast_p.next != nil
        slow_p = slow_p.next
        fast_p = fast_p.next.next
        if slow_p == fast_p
          return true
        end
        return false
      end
    end


    # Time Complexity: O(1)
    # Space Complexity: O(1)
    def get_first
      return nil if @head.nil?
      return @head.data
    end

    # Time Complexity:  O(n)
    # Space Complexity: O(1)
    def add_last(value)
      new_node = Node.new(value)
      if @head.nil?
        self.add_first(value)
        return
      end
      @tail.next = new_node
      new_node.previous = @tail
      @tail = new_node
    end

    def remove_last()
      value = @tail.data
      if @head == @tail
        @head = @tail = nil
      else
        @tail = @tail.previous
        @tail.next = nil
      end

      return value
    end

    # Time Complexity:  O(n)
    # Space Complexity: O(1)
    def get_last
      return nil if @head.nil?
      return @tail.data
    end

    # Time Complexity:  O(n)
    # Space Complexity: O(1)
    def insert_ascending(value)
      new_node = Node.new(value)
      add_first(value) if @head.nil?
      current = @head
      if current.data > new_node.data
        temp = @head
        @head = new_node
        temp.previous = @head
        new_node.next = temp
      end

      until current.nil?
        if current.data <= value && current.next.data > value
          temp = current.next
          current.next = new_node
          new_node.next = temp
          new_node.previous = current
          temp.previous = new_node
          return
        end
        current = current.next
      end
    end

    def create_cycle
      return if @head == nil

      current = @head
      while current.next != nil
          current = current.next
      end

      current.next = @head 
    end

    def to_s
      list = []

      current = @head
      until current.nil?
        list << current.data
        current = current.next
      end

      return list.to_s
    end
end
