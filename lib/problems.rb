require_relative './stack.rb'

# Time Complexity: O(n)
# Space Complexity: O(n)
def balanced(string)
  open_chars = Stack.new

  is_open = {
    '{' => '}', 
    '[' => ']',
    '(' => ')'
  }

  is_closed = {
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

# Time Complexity: O(n)
# Space Complexity: O(n)
def evaluate_postfix(postfix_expression)
  operands = []
  operations = {
    '+' => true,
    '-' => true, 
    '*' => true, 
    '/' => true
  }

  postfix_expression.each_char do |current|
    if !operations[current]
      operands << current.to_i
    elsif operands.length >= 2
      operand_2 = operands.pop
      operand_1 = operands.pop

      case current
      when '+'
        operands << operand_1 + operand_2
      when '-'
        operands << operand_1 - operand_2
      when '*'
        operands << operand_1 * operand_2 
      when '/'
        operands << operand_1 / operand_2
      end
    end
  end

  return operands.first
end
