require_relative './stack.rb'

# Time Complexity: O(n)
# Space Complexity: O(n)
def balanced(string)
    opening_closing_brace_pair = {
      "(" => ")",
      "[" => "]",
      "{" => "}"
    }

    opening_braces = opening_closing_brace_pair.keys

    unpaired_opening_braces = Stack.new

    string.each_char do |brace|
      if opening_braces.include?(brace)
        unpaired_opening_braces.push(brace)
      else
        unpaired_opening_brace = unpaired_opening_braces.pop

        expected_closing_brace = opening_closing_brace_pair[unpaired_opening_brace]

        if brace != expected_closing_brace
          return false
        end
      end
    end

    return unpaired_opening_braces.empty?
end


# From the postfix expression, when some operands are found, push them in the stack. 
# When some operator is found, two items are popped from the stack and the operation is performed in correct sequence. 
# After that, the result is also pushed in the stack for future use. 
# After completing the whole expression, the final result is also stored in the stack top.

# Time Complexity: O(n)
# Space Complexity: O(n)
def evaluate_postfix(postfix_expression)
  operands_stack = Stack.new

  postfix_expression.each_char do |char|
    if char =~ /[\+\-\*\/]/
      operator = char
      second_operands = operands_stack.pop
      first_operands =  operands_stack.pop
      result = eval("#{first_operands}#{operator}#{second_operands}")

      operands_stack.push(result)
    else
      operands_stack.push(char)
    end
  end

  return operands_stack.pop
end
