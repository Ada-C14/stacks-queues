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

# Time Complexity: O(n)
# Space Complexity: O(n)
def evaluate_postfix(postfix_expression)
  stack = Stack.new
  postfix_expression.each_char do |char|
    if /[0-9]/.match(char)
      stack.push(char.to_i)
    elsif /[\+\-\/\*]/.match(char)
      second_operand = stack.pop()
      first_operand = stack.pop()
      stack.push(first_operand.send(char, second_operand))
    end
  end

  return stack.pop()
end
