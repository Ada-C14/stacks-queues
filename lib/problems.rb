require_relative './stack.rb'


# Time Complexity: ?
# Space Complexity: ?
def balanced(string)
  # raise NotImplementedError, "Not implemented yet"
  return true if string.empty?

  stack = Stack.new()

  open = {
    '(' => ')',
    '{' => '}',
    '[' => ']'
  }

  close = {
    ')' => '(',
    '}' => '{',
    ']' => '['
  }

  string.each_char do |char|
    if open[char]
      stack.push(char)
    elsif close[char] != stack.pop
      return false
    end
  end

  return stack.empty?
  
end

# Time Complexity: ?
# Space Complexity: ?
def evaluate_postfix(postfix_expression)
  # raise NotImplementedError, "Not implemented yet"
end
