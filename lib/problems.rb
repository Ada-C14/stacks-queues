require_relative './stack.rb'

# Time Complexity: O(n*m)
# Space Complexity: O(m)
def balanced(string)
  # assumes these are only valid chars
  hash_table = {"}" => "{", "]" => "[", ")" => "("}  # space: O(m)? maybe O(1) bc size of this doesnt grow with input?
  stack = Stack.new

  string.each_char do |char|                            # time: O(n), space: o(m)
    # assumes will only ever get valid chars
    if !hash_table[char]
      stack.push(char)
    else
      return false if stack.pop != hash_table[char]     # time: O(1)
    end
  end

  return stack.empty?
end


# Time Complexity: O(n)
# Space Complexity: O(m) - chris says o(n)
def evaluate_postfix(postfix_expression)
  # assumes these are only valid operations
  operations = {"*" => true, "+" => true, "/" => true, "-" => true}    # space: O(m), maybe O(1) bc size of this doesnt grow with input?
  stack = Stack.new     
  result = ""

  postfix_expression.each_char do |char|    # time: O(n)
    if operations[char]                     # time: O(1)
      num2 = stack.pop.to_i                 # time: O(1)
      num1 = stack.pop.to_i                 # time: O(1)
      result = num1.method(char).(num2)
      stack.push(result)                    # time: O(1), space: O(1)?? because will never be larger than 3 elements
    else
      stack.push(char)                      # time: O(1)
    end
  end

  return result

end
