require_relative './stack.rb'

# Time Complexity: O(n) - has to iterate through each char in the string input
# Space Complexity: O(n) - the stack is directly correlated with the string.length
def balanced(string)
  return true if string.empty?

  parens_hash = {"{" => "}",
    "[" => "]",
    "(" => ")"
  }

  stack = Stack.new

  string.each_char do |char|
    # check if it's an open paren 
    if parens_hash.include?(char)
      stack.push(parens_hash[char])
    else # it's a closed paren
      paren = stack.pop
      return false if char != paren
    end
  end

  return stack.empty?
end

# Time Complexity: ?
# Space Complexity: ?
def evaluate_postfix(postfix_expression)
  stack = Stack.new
  


end
