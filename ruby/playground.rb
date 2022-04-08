require_relative "./src/v.rb"
require_relative "./src/depth_first_traverse.rb"

require "benchmark"
require "pry"

graph0 = V.new(
  4,
  V.new(2, V.new(1), V.new(5, nil, V.new(7))),
  V.new(3, V.new(8, V.new(3, V.new(1))), V.new(2))
)

# avg_output: []
# traverse_output: [4, 2, 1, 5, 7, 3, 8, 3, 1, 2]
# levels_output: [[4], [2, 3], [1, 5, 8, 2], [7, 3], [1]]

graph1 = V.new(
  4,
  V.new(7, V.new(10), V.new(2, nil, V.new(6, V.new(2)))),
  V.new(9, nil, V.new(6))
)

# avg_output: [4, 8, 6, 6, 2]
# traverse_output: [4, 7, 10, 2, 6, 2, 9, 6]
# levels_output: [[4], [7, 9], [10, 2, 6], [6], [2]]

# DepthFirstTraverse.on_screen(graph0)

# DepthFirstTraverse.collect(graph0)

# DepthFirstTraverse.collect_levels(gr)







NUMBERS = (1..10).to_a
# (1..10).map do |i|
#   V.new(NUMBERS.sample, )
# end

def bt(depth)
  depth -= 1
  n = NUMBERS.sample
  return V.new(n) if depth <= 0
  return V.new(n, bt(depth), bt(depth))
end

#DepthFirstTraverse.collect(graph0)

# gr1 = bt(1)
# gr2 = bt(10)
# gr3 = bt(20)

data = (1..22).map { |i| bt(i) }

results = {}

data.map.with_index do |tree, index|
  depth = index + 1
  v = (1..depth).to_a.reverse.map { |n| (2**(n-1)) }.reduce(:+)
  e = (v - 1)
  puts "Tree depth: #{depth} | V = #{v} | E = #{e} | O(|V| + |E|) = O(#{v} + #{e}) = O(#{v+e})"
  bm = Benchmark.measure("1") { DepthFirstTraverse.collect_iter(tree) }
  puts bm.inspect

  results[v+e] = bm.real
end

# puts Benchmark.measure("1") { DepthFirstTraverse.collect(gr1) }.inspect
# puts Benchmark.measure("10") { DepthFirstTraverse.collect(gr2) }.inspect
# puts Benchmark.measure("20") { DepthFirstTraverse.collect(gr3) }.inspect

binding.pry
