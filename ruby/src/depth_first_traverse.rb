module DepthFirstTraverse
  def self.on_screen(node)
    # This is not tail-recursive.
    print "#{node.value} - "
    on_screen(node.left) if node.left
    on_screen(node.right) if node.right
  end

  def self.collect(node)
    # This is not tail-recursive.
    l = collect(node.left).compact if node.left
    r = collect(node.right).compact if node.right
    [node.value, l, r].compact.flatten
  end

  def self.collect_multi_rec(node)
    return [] if node.explored
    node.explored = true
    return [node.value, node.connections.map { |edge| collect_multi_rec(edge) }].flatten
  end

  def self.collect_iter(node)
    # procedure DFS_iterative(G, v) is
    # let S be a stack
    # S.push(v)
    # while S is not empty do
    #     v = S.pop()
    #     if v is not labeled as discovered then
    #         label v as discovered
    #         for all edges from v to w in G.adjacentEdges(v) do
    #             S.push(w)

    # --------------------- working with binary trees - BEGIN
    # results = []
    # stack = [node]

    # while !stack.empty?
    #   v = stack.pop()
    #   results.push(v.value)
    #   edges = [v.right, v.left].compact
    #   edges.each do |edge|
    #     stack.push(edge)
    #   end
    # end
    # --------------------- working with binary trees - END

    # --------------------- working with general graphs - BEGIN
    explored = Hash.new(false)
    results = []
    stack = [node]

    while !stack.empty?
      v = stack.pop()

      if !explored[v.value]
        puts "traversing #{v.value} with #{node.connections.count} edges"
        results.push(v.value)
        explored[v.value] = true
        node.connections.each do |edge|
          stack.push(edge)
        end
      end
    end
    # --------------------- working with general graphs - END

    results
  end

  def self.collect_levels(node, acc: Hash.new([]), lvl: 0)
    acc[lvl] += [node.value]
    collect_levels(node.left, acc: acc, lvl: lvl + 1) if node.left
    collect_levels(node.right, acc: acc, lvl: lvl + 1) if node.right
    return acc.values
  end

  def self.avg_per_level(node)
    collect_levels(node).map { |list| avg(list) }
  end

  def self.avg(list)
    list.reduce(:+).to_f / list.count
  end

  def self.max_depth(node, max = 0)
    return max if node.left.nil? && node.right.nil?

    [node.left, node.right].compact.map { |v| max_depth(v, max + 1) }.max
  end
end
