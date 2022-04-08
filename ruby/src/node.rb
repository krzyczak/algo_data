class Node
  def initialize(value, connections = [])
    @value, @connections = value, connections
    @explored = false
  end

  attr_accessor :value, :connections, :explored
end
