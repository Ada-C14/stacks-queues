require 'set'
require_relative 'queue'

class TreeNode
  # attr_reader :key, :value
  attr_accessor :left, :right, :key, :value # adding write access to key and value for delete method

  def initialize(key, val)
    @key = key
    @value = val
    @left = nil
    @right = nil
  end
end

class Tree
  attr_reader :root
  def initialize
    @root = nil
  end

  # Time Complexity: O(log n)
  # >> Assuming balanced BST, O(log n) time complexity (half the num nodes to check each time)
  # >> If not balanced, could be O(n)
  # Space Complexity: O(1)
  # >> keep track of current tree node
  def add(key, value = nil)
    return @root = TreeNode.new(key, value) if @root.nil?

    current = @root
    until current.nil?
      if key > current.key
        if !current.right
          current.right = TreeNode.new(key, value)
          return
        else
          current = current.right
        end
      else
        if !current.left
          current.left = TreeNode.new(key, value)
          return
        else
          current = current.left
        end
      end
    end
  end

  # Time Complexity: O(log n)
  # >> Assuming balanced BST, O(log n) time complexity (half the num nodes to check each time)
  # >> If not balanced, could be O(n)
  # Space Complexity: O(1)
  # >> Keep track of current node
  def find(key)
    return nil if @root.nil?

    current = @root
    until current.nil?
      return current.value if current.key == key

      current = if key > current.key
                  current.right
                else
                  current.left
                end
    end

    return nil
  end

  def find_return_node(key)
    return nil if @root.nil?

    current = @root
    until current.nil?
      return current if current.key == key

      current = if key > current.key
                  current.right
                else
                  current.left
                end
    end

    return nil
  end

  # Time Complexity: O(n)
  # >> hit every node in tree during traversal
  # Space Complexity: O(log n)
  # >> go down one side of tree at a time --> stack has height # of levels
  # >> O(n) if unbalanced
  def inorder
    return [] if @root.nil?

    nodes_arr = []
    inorder_helper(@root, nodes_arr)

    return nodes_arr
  end

  def inorder_helper(current, nodes_arr)
    return if current.nil?

    inorder_helper(current.left, nodes_arr)
    nodes_arr << { key: current.key, value: current.value }
    inorder_helper(current.right, nodes_arr)
  end

  # Time Complexity: O(n)
  # >> hit every node in tree during traversal
  # Space Complexity: O(log n)
  # >> go down one side of tree at a time --> stack has height # of levels
  # >> O(n) if unbalanced
  def preorder
    return [] if @root.nil?

    nodes_arr = []
    preorder_helper(@root, nodes_arr)

    return nodes_arr
  end

  def preorder_helper(current, nodes_arr)
    return if current.nil?

    nodes_arr << { key: current.key, value: current.value }
    preorder_helper(current.left, nodes_arr)
    preorder_helper(current.right, nodes_arr)
  end

  # Time Complexity: O(n)
  # >> hit every node in tree during traversal
  # Space Complexity: O(log n)
  # >> go down one side of tree at a time --> stack has height # of levels
  # >> O(n) if unbalanced
  def postorder
    return [] if @root.nil?

    nodes_arr = []
    postorder_helper(@root, nodes_arr)

    return nodes_arr
  end

  def postorder_helper(current, nodes_arr)
    return if current.nil?

    postorder_helper(current.left, nodes_arr)
    postorder_helper(current.right, nodes_arr)
    nodes_arr << { key: current.key, value: current.value }
  end

  # Time Complexity: O(n)
  # >> Go through every node in tree to confirm deepest level
  # Space Complexity: O(log n)
  # >> store set of unique levels / depths (log n)
  # >> store current node O(1)
  # >> store current height O(1)
  def height
    return 0 if @root.nil?

    heights = Set.new
    height_helper(@root, heights, 1)

    return heights.size
  end

  def height_helper(current, heights, curr_height)
    return if current.nil?

    heights << curr_height
    height_helper(current.left, heights, curr_height + 1)
    height_helper(current.right, heights, curr_height + 1)
  end

  ##########################################

  # BFS - Using Queue

  # Time Complexity: O(n)
  # >> may need to traverse all nodes in tree
  # Space Complexity: O(n)
  # >> for balanced tree, most nodes in queue would be last level (n/2 + 1) --> O(n)
  #
  # PSEUDOCODE:
  # >> Want to search all sibling nodes first before going to child
  # >> Start from root and add children to queue
  # >> FIFO --> always search nodes on same level before children
  #
  # Assumptions:
  # input is a node key (treeNode class from previous week has key and value)
  # return nil if not found or tree is empty
  # return value if it is found
  # using queue class created for this assignment

  def bfs_queue(search_key)
    return nil if @root.nil?
    return @root.value if @root.key == search_key

    search_nodes_queue = Queue.new
    search_nodes_queue.enqueue(@root)

    while search_nodes_queue.size > 0
      check_node = search_nodes_queue.dequeue

      if check_node.key == search_key
        return check_node.value
      else
        search_nodes_queue.enqueue(check_node.left) if check_node.left
        search_nodes_queue.enqueue(check_node.right) if check_node.right
      end
    end

    return nil
  end

  ##########################################

  # Useful for printing
  def to_s
    return "#{self.inorder}"
  end

  # Time Complexity: O(log n)
  # >> O(log n) to find node with input key (assuming balanced, otherwise, worst-case O(n))
  # >> O(log n) to find replacement node as-needed
  # Space Complexity: O(log n)
  # >> O(log n) call stack for recursive calls (assuming balanced, otherwise, worst-case O(n))
  # >> O(1) to keep track of current node and key to delete
  #
  # PSEUDOCODE:
  # Search:
  # >> go left if key to delete is < current key
  # >> go right if key to delete is > current key
  # >> if key to delete == current key, we must consider how to delete / replace as necessary
  #
  # Delete + replace:
  # >> if leaf just delete
  # >> if has right child, then replace with leftmost child of first right child (METHOD NAME HERE)
  # >> WHY? the first right child is larger than the node to delete; getting leftmost ensures the smallest of the
  # larger nodes
  # >> if no right child and has left child, replace with rightmost child of first left child
  # # >> WHY? the first left child ensures smaller key than key of node to delete;
  # rightmost ensures we are replacing with the largest of the smaller nodes in that subtree
  def delete(key)
    return if @root.nil?

    current = @root
    delete_helper(current, key)

    return
  end

  def delete_helper(current_node, key_to_delete)
    return if current_node.nil?

    # Need to search left subtree for node to delete
    if current_node.key > key_to_delete
      current_node.left = delete_helper(current_node.left, key_to_delete)
      # Need to search right subtree for node to delete
    elsif current_node.key < key_to_delete
      current_node.right = delete_helper(current_node.right, key_to_delete)
    else
      # We found the node to delete
      # If leaf, we can just delete
      if !current_node.left && !current_node.right
        current_node = nil
        # Right child exists --> replace with the leftmost child of first right child
      elsif current_node.right
        current_node.key, current_node.value = replacement_node_has_right_child(current_node.right)
        current_node.right = delete_helper(current_node.right, current_node.key)
        # No right child --> replace with the rightmost child of first left child
      else
        current_node.key, current_node.value = replacement_node_no_right_child(current_node.left)
        current_node.left = delete_helper(current_node.left, current_node.key)
      end
    end

    return current_node
  end

  def replacement_node_has_right_child(current_node)
    current_node = current_node.left while current_node.left

    return current_node.key, current_node.value
  end

  def replacement_node_no_right_child(current_node)
    current_node = current_node.right while current_node.right

    return current_node.key, current_node.value
  end
end
