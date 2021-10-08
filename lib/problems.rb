require_relative './stack.rb'

# Time Complexity: O(n)
# Space Complexity: O(n)
def balanced(string)
  if string.empty?
    true
  end

  brackets = Stack.new

  string.each_char do |char|
    if char == "{" || char == "(" || char == "["
      brackets.push(char)
    elsif char == "}" || char == ")" || char == "]"
      if char == "}" && brackets[-1] == "{"
        brackets.pop
      elsif char == ")" && brackets[-1] == "("
        brackets.pop
      elsif char == "]" && brackets[-1] == "["
        brackets.pop
      else
        false
      end
    end
  end
  if brackets.empty?
    true
  else
    false
  end
end

# Time Complexity: ?
# Space Complexity: ?
def evaluate_postfix(postfix_expression)
  stack = []
  math = '*+/-'

  postfix_expression.each_char do |char|
    if char.is_a?Integer
      stack << char.to_i
    elsif math.include?char
      num2 = stack.pop
      num1 = stack.pop
      stack << calculator(num1, num2, char)
    end
  end
  stack.pop
end

def calculator(num1,num2,operator)
  if operator == '+'
    num1 + num2
  elsif operator == '-'
    num1 - num2
  elsif operator == '*'
    num1 * num2
  elsif operator == '/'
    num1/num2
  end
end