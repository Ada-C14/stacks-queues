require_relative './stack.rb'

# Time Complexity: O(n), it has to run thru the whole string to check the balance, so it's O(n).
# Space Complexity: O(n), the worst case scenario is to store all the chars in the string to the linked list, so it's O(n).
def balanced(string)
  opening = {"{" => true, "[" => true, "(" => true}
  closing = {"}" => "{", "]" => "[", ")" => "("}
  result = Stack.new

  string.each_char do |char|
    if opening[char]
      result.push(char)
    elsif closing[char]
      return false if result.pop != closing[char]
    end
  end

  return result.empty?
end

# Time Complexity: O(n), it has to run thru the whole postfix expression to do the calculation, so it's O(n).
# Space Complexity: O(n), the worst case scenario is to store all the chars in the string to the linked list, so it's O(n).
def evaluate_postfix(postfix_expression)
  operators = {"+" => true, "-" => true, "*" => true, "/" => true}
  result = Stack.new

  postfix_expression.each_char do |char|
    if operators[char]
      num2 = result.pop
      num1 = result.pop
      calculation = num1.send(char, num2)
      result.push(calculation)
    else
      result.push(char.to_i)
    end
  end

  return result.get_first
end
