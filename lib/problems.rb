require_relative './stack.rb'

# Time Complexity: O(n)
# Space Complexity: O(n)

def balanced(string)
  opening_braces = ['{','[','(']
  stack = Stack.new
  return true if string == ''
  i = 0
  while i < string.length
      if opening_braces.include?(string[i])
        stack.push(string[i])
      else
        current = stack.pop
        match = false
        if current == "{" && string[i] == "}"
          match = true
        elsif current == "[" && string[i] == "]"
          match = true
        elsif current == "(" && string[i] == ")"
          match = true
        end

        return false if !match
      end

      i += 1
  end

  return stack.empty?
end

# Time Complexity: ?
# Space Complexity: ?
# def evaluate_postfix(postfix_expression)
#   operators = ["+","-", "*", "/"]
#   stack = Stack.new
#   raise ArgumentError if postfix_expression == ""
#   i = 0
#   while i < postfix_expression.length
#     if operators.include?(postfix_expression[i])
#       temp_result = stack.pop postfix_expression[i] stack.pop
#     else
#       stack.push(postfix_expression[i])
#     end
#     i += 1
#   end 
# end
