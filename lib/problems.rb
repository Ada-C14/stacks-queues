require_relative './stack.rb'

# Time Complexity: ?
# Space Complexity: ?
def balanced(string)
  open_chars = Stack.new

  is_open = {
    '{' => '}', 
    '[' => ']',
    '(' => ')'
  }

  is_closed ={
    '}' => '{',
    ']' => '[',
    ')' => '('
  }

  string.each_char do |char|
    if is_open[char]
      open_chars.push(char)
    elsif is_closed[char] != open_chars.pop
      return false
    end
  end

  return open_chars.empty?
end

# Time Complexity: ?
# Space Complexity: ?
def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end
