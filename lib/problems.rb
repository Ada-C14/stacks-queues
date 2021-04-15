require_relative './stack.rb'

# Time Complexity: ?
# Space Complexity: ?

# unfinished not passing, but can you give some feedback on my approach

def balanced(string)
  return false if string.length == 0
  stack = []
  array = string.chars
  opening = ["(", "{", "["]

  array.each do char
    if opening.include(char)
      stack.push(char)
    elsif stack.length == 0
      return false
    else
      current_char = stack.pop
      if current_char == "(" && char != ")"
        return false
      elsif current_char == "{" && char != "}"
        return false
      elsif current_char == "[" && char != "]"
        return false
      end 
    end
  end
  return true
end

# Time Complexity: ?
# Space Complexity: ?
def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end
