require "minitest/autorun"
require "minitest/reporters"

Minitest::Reporters.use!(
  Minitest::Reporters::ProgressReporter.new,
  ENV,
  Minitest.backtrace_filter
)

require_relative "../src/v.rb"
require_relative "../src/breadth_first_traverse.rb"

class TestBreadthFirstTraverse < MiniTest::Test
  def setup
    @graph0 = V.new(
      4,
      V.new(2, V.new(1), V.new(5, nil, V.new(7))),
      V.new(3, V.new(8, V.new(3, V.new(1))), V.new(2))
    )

    @graph1 = V.new(
      4,
      V.new(7, V.new(10), V.new(2, nil, V.new(6, V.new(2)))),
      V.new(9, nil, V.new(6))
    )
  end

  def test_graph0_collect
    expected_traverse_output = [4, 2, 3, 1, 5, 8, 2, 7, 3, 1]
    assert_equal(expected_traverse_output, BreadthFirstTraverse.collect(@graph0))
  end

  def test_graph1_collect
    expected_traverse_output = [4, 7, 9, 10, 2, 6, 6, 2]
    assert_equal(expected_traverse_output, BreadthFirstTraverse.collect(@graph1))
  end
end
