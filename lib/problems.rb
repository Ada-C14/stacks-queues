require_relative './stack.rb'

# Time Complexity: O(n)
# Space Complexity: O(n)
def balanced(string)
  open = {
    "(" => true,
    "{" => true,
    "[" => true
  }

  close = {
    ")" => "(",
    "}" => "{",
    "]" => "["
  }

  results = Stack.new

  string.each_char do |char|
    if open[char]
      results.push(char)
    elsif close[char]
      return false if results.pop != close[char]
    end
  end

  results.empty?
end

# Time Complexity: O(n)
# Space Complexity: O(n)
def evaluate_postfix(postfix_expression)
  stack = []
  math = '*+/-'

  postfix_expression.each_char do |char|
    if math.include?char
      num2 = stack.pop
      num1 = stack.pop
      stack << calculator(num1, num2, char)
    else
      stack << char.to_i
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