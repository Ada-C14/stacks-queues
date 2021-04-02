require_relative './stack.rb'

# Time Complexity: O(n) -- number of characters to check depends on number of characters 
# in string - hash lookup is O(1) to check for braces

# Space Complexity: O(n) -- worst case is that Stack expands to include every character of 
# input string, which depends on num chars in input string - hash lookup is O(1) to check for braces
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

# Time Complexity: O(n) - Number of characters checked depends on number of characters in string
# Space Complexity: O(n) - Stack will increase depending on number of chars in string before an operand is found -- 
# worst case is that they appear at the end (and therefore the latter third of the expression), which
# indicates max size of stack depends on number of chars in input string
def evaluate_postfix(postfix_expression)
  operands = Set['+', '-', '*', '/'] # assume only these four operands for now
  stack = Stack.new # track operation results

  postfix_expression.each_char do |c| # assume expresion is valid
    if operands.include?(c) # is operand
      b = stack.pop # get second number pushed
      a = stack.pop # pop again for first number pushed

      new_top = 0

      # calculate new number to push into stack
      new_top += case c
                  when '+' 
                    a + b
                  when '-'
                    a - b
                  when '/'
                    a / b
                  when '*'
                    a * b
                  end

      stack.push(new_top) # add back to top of stack

    else # is number
      stack.push(c.to_i)
    end
  end

  return stack.pop
end
