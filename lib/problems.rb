require_relative './stack.rb'

# Time Complexity: O(n) -- number of characters to check depends on number of characters 
# in string

# Space Complexity: O(n) -- worst case is that Stack expands to include every character of 
# input string, which depends on num chars in input string
def balanced(string)
  # hashes to track braces
  close_to_open = {'}' => '{', ')' => '(', ']' => '['}
  open_to_close = {'{' => '}', '(' => ')', '[' => ']'}
  # brace stack
  stack = Stack.new

  string.each_char do |c| # this automatically iterates in order i think
    if open_to_close[c]
      stack.push(c)
    elsif close_to_open[c]
      get_top = stack.pop
      return false if close_to_open[c] != get_top # must match brace
    end 
  end

  return stack.empty?
end

# Time Complexity: ?
# Space Complexity: ?
def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end
