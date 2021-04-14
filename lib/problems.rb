require_relative './stack.rb'

# Time Complexity: O(n)
# Space Complexity: O(n)
def balanced(string)
  stack = Stack.new
  string.each_char do |char|
    if char == "(" || char == "[" || char == "{"
      stack.push(char)
    elsif char == ")" || char == "]" || char == "}"
      last_pushed = stack.pop()
      if last_pushed == "(" && char != ")" || 
        last_pushed == "[" && char != "]" ||
        last_pushed == "{" && char != "}"
        return false
      end
    end 
  end

  # check if stack is full of opening braces
  return stack.empty?
end

# Time Complexity: ?
# Space Complexity: ?
def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end
