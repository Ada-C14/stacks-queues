require_relative './Stack.rb'

# Time Complexity: O(nlogn)
# Space Complexity: O(n)
def balanced(string)
  stack = Stack.new
  arr = string.split('')
  chars = ['(', '[', '{']
  arr.each do |char|
    if chars.include?(char)
      stack.push(char)
    else
      current = stack.pop
      if current == '(' && char != ')'
        return false
      elsif current == '[' && char != ']'
        return false
      elsif current == '{' && char != '}'
        return false
      end
    end
  end
    return stack.empty?
end

# Time Complexity: O(n)
# Space Complexity: O(n)
def evaluate_postfix(postfix_expression)
  stack = Stack.new
  postfix_expression.each_char do |char|
    if char.match(/[0-9]/)
      stack.push(char.to_i)
    else
      a = stack.pop
      b = stack.pop
      stack.push(eval "#{b}#{char}#{a}")
    end
  end
  return stack.pop
end
