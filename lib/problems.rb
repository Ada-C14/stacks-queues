require_relative './stack'
require_relative './queue'
require_relative './tree'
require 'set'

# Time Complexity: O(n)
# >> iterate through each char in the input string
# Space Complexity: O(n)
# >> At worst, storing half of the chars in the input string in stack
#
# PSEUDOCODE:
# >> Different types of braces can be expected in input
# >> We can use a stack to store the opening braces
# >> Once we hit a closing brace, we can pop off the stack
# the popped item must be the same type of brace
# otherwise, unbalanced
# >> Can also be unbalanced if stack is not empty when finished iterating through input string

OPENING_BRACES = Set['{', '[', '(']

def balanced(string)
  return true if string.empty?

  seen_opening_braces = Stack.new

  string.each_char do |brace|
    if OPENING_BRACES.include?(brace)
      seen_opening_braces.push(brace)
    elsif brace == ']'
      return false unless seen_opening_braces.pop == '['
    elsif brace == '}'
      return false unless seen_opening_braces.pop == '{'
    elsif brace == ')'
      return false unless seen_opening_braces.pop == '('
    end
  end

  return seen_opening_braces.empty?
end

# Time Complexity: O(n)
# >> iterate through each character of input string
# Space Complexity: O(1)
# >> assuming a valid input, my storage stack should only ever store 2 items at a time
# (an operator should come next)
#
# PSEUDOCODE:
# Assumptions:
# >> input only contains valid numbers and operators
# >> assume nums are integers
# >> assume no dividing by 0 --
# could throw an error if we encounter 0, but 0 could also be an invalid input converted to_i

OPERATORS = Set['+', '-', '*', '/', '**']

def eval_helper(first_num, second_num, operator)
  case operator
  when '+'
    result = first_num + second_num
  when '-'
    result = first_num - second_num
  when '*'
    result = first_num * second_num
  when '/'
    result = first_num / second_num
  when '**'
    result = first_num**second_num
  end

  return result
end

def evaluate_postfix(postfix_expression)
  expression_stack = Stack.new
  postfix_expression.each_char do |char|
    if OPERATORS.include?(char)
      second_num = expression_stack.pop
      first_num = expression_stack.pop
      result_num = eval_helper(first_num.to_i, second_num.to_i, char)
      expression_stack.push(result_num)
    else
      expression_stack.push(char)
    end
  end

  final = expression_stack.pop
  if expression_stack.empty?
    return final
  else
    raise ArgumentError, 'invalid input'
  end
end

##########################################

# BFS - Using Queue (see tree class)
