require_relative './stack.rb'

# Time Complexity: O(n) - where n is the number of characters in the string
# Space Complexity: O(n) - worse case, all characters are openers and we push them all into the stack. 
def balanced(string)
  brackets = {
    "(" => ")",
    "{" => "}",
    "[" => "]"
  }

  openers = brackets.keys
  closers = brackets.values

  opener_stack = []

  string.each_char do |char|
    if openers.include?(char)
      opener_stack.push(char)
    end

    if closers.include?(char)
      if opener_stack.empty?
        return false
      else
        removed_opener = opener_stack.pop
        if char != brackets[removed_opener]
          return false
        end
      end
    end
  end

  return opener_stack.empty?

end

# Time Complexity: O(n) - where n is the number of characters in the expression 
# Space Complexity: O(n) - We're using a stack to store values. 
def evaluate_postfix(postfix_expression)
  stack = []
  postfix_expression.each_char do |element|
    if element == element.to_i.to_s
      stack.push(element.to_i)
    else
      b = stack.pop
      a = stack.pop 
      case element
      when "+"
        stack.push(a + b)
      when "-"
        stack.push(a - b)
      when "*"
        stack.push(a * b)
      when "/"
        stack.push(a / b)
      end
    end
  end
  return stack.pop
end


