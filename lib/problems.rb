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

# Time Complexity: ?
# Space Complexity: ?
def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end
