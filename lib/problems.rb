require_relative './stack.rb'

# Time Complexity: O(n)
# Space Complexity: O(n)
def balanced(string)
  if string.empty?
    true
  end

  brackets = []

  string.each_char do |char|
    if char == "{" || char == "(" || char == "["
      brackets << char
    elsif char == "}" || char == ")" || char == "]"
      if char == "}" && brackets[-1] == "{"
        brackets.pop
      elsif char == ")" && brackets[-1] == "("
        brackets.pop
      elsif char == "]" && brackets[-1] == "["
        brackets.pop
      else
        false
      end
    end
  end
  if brackets.empty?
    true
  else
    false
  end
end

# Time Complexity: ?
# Space Complexity: ?
def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end