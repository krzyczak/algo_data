# The queires loop is OK but there is bug. Figure out the bug in a single query array and then bring this back

require "pry"

class NodeX
  def initialize(value, children = [])
    @value, @children = value, children
  end

  attr_accessor :value, :children
end


module Subtrees
  def self.call(node, queries = [], text = "", counts = Hash.new(0), current_subtrees = [])
    return [] if queries.empty? || text.empty?

    # return queries.map { |u, c| counts["#{u}#{c}"] } if node.nil?

    queries.each do |queryX|
      # need to take care of multiple queries
      # binding.pry
      q_number, q_char = queryX
      query = "#{q_number}#{q_char}"

      if node.value == q_number
        current_subtrees << query
      end
    end

    current_subtrees.each do |cs|
      if cs.split("").last == text[node.value - 1] # in Java it would be text.charAt(q_number) as strings are 1-based index
        counts[cs] += 1
      end
    end

    # call(node.left, queries, text, counts, current_subtrees)
    # call(node.right, queries, text, counts, current_subtrees)

    return queries.map { |u, c| counts["#{u}#{c}"] } if node.children.empty?

    node.children.each do |child|
      call(child, queries, text, counts, current_subtrees.dup)
    end

    return queries.map { |u, c| counts["#{u}#{c}"] }
  end
end

root = NodeX.new(1, [NodeX.new(2), NodeX.new(3)])

result = Subtrees.call(root, [[1, "a"]], "aba")
puts "Expected: [2], Actual: #{result}"



# root = NodeX.new(1, [ NodeX.new(2, [NodeX.new(4), NodeX.new(5)]), NodeX.new(3, [NodeX.new(6)]), NodeX.new(7) ])

root = NodeX.new(1);
root.children << NodeX.new(2)
root.children << NodeX.new(3)
root.children << NodeX.new(7)

root.children[0].children << NodeX.new(4)
root.children[0].children << NodeX.new(5)

root.children[1].children << NodeX.new(6)


result = Subtrees.call(root, [[1, "a"], [2, "b"], [3, "a"]], "abaacab")
puts "Expected: [4, 1, 2], Actual: #{result}"
