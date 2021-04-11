require_relative './stack.rb'

# Time Complexity: ?
# Space Complexity: ?
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

# Time Complexity: ?
# Space Complexity: ?
def evaluate_postfix(postfix_expression)
  raise NotImplementedError, "Not implemented yet"
end
