require_relative './stack.rb'

# Time Complexity: O(n)
# Space Complexity: O(n)
def balanced(string)
  return true if string.empty?

  open = {
    '{' => '}',
    '[' => ']',
    '(' => ')'
  }
  close = {
    '}' => '{',
    ']' => '[',
    ')' => '('
  }
  stack = Stack.new()

  string.each_char do |c|
    if open.has_key?(c)
      stack.push(c)
    elsif close.has_key?(c)
      brace = stack.pop
      return false if brace != close[c]
    else
      return false # String has an invalid character
    end
  end
  return stack.empty?
end

# Time Complexity: O(n)
# Space Complexity: ?
def evaluate_postfix(postfix_expression)
  stack = Stack.new()
  operators = {
    '*' => true,
    '+' => true,
    '-' => true,
    '/' => true
  }

  postfix_expression.each_char do |c|
    if operators[c]
      y = stack.pop.to_i
      x = stack.pop.to_i
      result = x.method(c).(y)
      stack.push(result)
    else
      stack.push(c)
    end
  end
  return stack.pop
end
