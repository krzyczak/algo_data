module BreadthFirstTraverse
  def self.collect(node)
    explored = Hash.new(false)
    queue = [node]

    # explored[node.object_id] = true
    # queue.push(node)

    result = []

    while !queue.empty?
      # v = queue.pop() # from right to left
      v = queue.shift() # from left to right

      result.push(v.value) # if v.left.nil? && v.right.nil? # if v is the goal return v

      edges = [v.left, v.right].compact
      edges.each do |edge|
        # if !explored[edge.object_id]
        #   queue.push(edge)
        #   explored[edge.object_id] = true
        # end
        queue.push(edge)
      end
    end

    result
  end
end
