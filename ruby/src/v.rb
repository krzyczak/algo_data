class V
  def initialize(value, left = nil, right = nil)
    @value, @left, @right = value, left, right
  end

  attr_accessor :value, :left, :right
end
