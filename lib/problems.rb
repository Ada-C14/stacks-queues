require_relative './stack.rb'

# Time Complexity: o(n)
# Space Complexity: o(n)
def balanced(string)
  # raise NotImplementedError, "Not implemented yet"
  return true if string.length == 0

  pairs = {"(" => ")", "{" => "}", "[" => "]"}

  stack = Stack.new()

  string.each_char do |char|
    if pairs[char]
      selected_char = pairs[char]
      stack.push(selected_char)
    else
      if stack.pop != char 
        return false
      end
    end
  end
  return stack.empty?
end

# Time Complexity: O(n)
# Space Complexity: o(n)
def evaluate_postfix(postfix_expression)
  stack = Stack.new()

  postfix_expression.each_char do |element|
    if element.to_i.to_s == element
      stack.push(element.to_i)
    else
      # get the last 2 nums and store them 
      num1 = stack.pop
      num2 = stack.pop
      case element
      when "+"
        result = answer = num1 + num2 
      when "/"
        result = answer = num1 + num2 
      when "-"
        result = answer = num1 + num2 
      when "*"
        result = answer = num1 + num2 
      end
    
      stack.push(result)
      if stack.empty?
        return result
      end
    end
  end
end



