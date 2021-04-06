require_relative './stack.rb'

# Time Complexity: O(n) for iterating the string (O(1) for operations pop, push, hash lookup and check empty)
# Space Complexity: O(n) to store all the chars of the string

BRACES = {
  "{" => "}",
  "[" => "]",
  "(" => ")"
}

def balanced(string)
  stack = []
  string.each_char do |char|
    if BRACES.key?(char)
      stack << char
    else
      return false unless BRACES[stack.pop] == char 
    end
  end
  return stack.empty?
end
  
# Time Complexity: O(n)
# Space Complexity: o(n)
OPERATORS = ["+", "-", "*", "/"]
def evaluate_postfix(postfix_expression)
  stack = []
  postfix_expression.each_char do |char|
    if OPERATORS.include?(char)
      second_operand = stack.pop.to_i
      first_operand = stack.pop.to_i
      raise ArgumentError unless first_operand && second_operand
      case char
      when "+"
        stack << first_operand + second_operand 
      when "-"
        stack << first_operand - second_operand 
      when "*"
        stack << first_operand * second_operand 
      else
        second_operand == 0 ? (raise ZeroDivisionError.new) : stack << first_operand / second_operand
      end
    else
      stack << char
    end
  end
  return stack[0]
end
