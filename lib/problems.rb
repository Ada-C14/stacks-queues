require_relative './stack.rb'

# Time Complexity: O(n*m)
# Space Complexity: O(m)
def balanced(string)
  # assumes these are only valid chars
  hash_table = {"}" => "{", "]" => "[", ")" => "("}  # space: O(m)
  stack = []

  string.each_char do |char|                         # time: O(n)
    if hash_table.has_value?(char)              # time: O(m)?
      stack.push(char)
    else
      return false if stack.pop != hash_table[char]    # time: O(1)
    end
  end

  return stack.empty?
end


# Time Complexity: ?
# Space Complexity: ?
def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end
