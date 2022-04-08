require "minitest/autorun"
require "minitest/reporters"

Minitest::Reporters.use!(
  Minitest::Reporters::ProgressReporter.new,
  ENV,
  Minitest.backtrace_filter
)

require_relative "../src/v.rb"
require_relative "../src/depth_first_traverse.rb"

class TestDepthFirstTraverse < MiniTest::Test
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
    expected_traverse_output = [4, 2, 1, 5, 7, 3, 8, 3, 1, 2]
    assert_equal(expected_traverse_output, DepthFirstTraverse.collect(@graph0))
  end

  def test_graph0_collect_iter
    expected_traverse_output = [4, 2, 1, 5, 7, 3, 8, 3, 1, 2]
    assert_equal(expected_traverse_output, DepthFirstTraverse.collect_iter(@graph0))
  end

  def test_graph0_collect_levels
    expected_levels_output = [[4], [2, 3], [1, 5, 8, 2], [7, 3], [1]]
    assert_equal(expected_levels_output, DepthFirstTraverse.collect_levels(@graph0))
  end

  def test_graph0_avg_per_level
    expected_avg_output = [4, 2.5, 4, 5, 1]
    assert_equal(expected_avg_output, DepthFirstTraverse.avg_per_level(@graph0))
  end

  def test_graph0_max_depth
    expected_max_depth = 4
    assert_equal(expected_max_depth, DepthFirstTraverse.max_depth(@graph0))
  end

  def test_graph1_collect
    expected_traverse_output = [4, 7, 10, 2, 6, 2, 9, 6]
    assert_equal(expected_traverse_output, DepthFirstTraverse.collect(@graph1))
  end

  def test_graph1_collect_iter
    expected_traverse_output = [4, 7, 10, 2, 6, 2, 9, 6]
    assert_equal(expected_traverse_output, DepthFirstTraverse.collect_iter(@graph1))
  end

  def test_graph1_collect_levels
    expected_levels_output = [[4], [7, 9], [10, 2, 6], [6], [2]]

    assert_equal(expected_levels_output, DepthFirstTraverse.collect_levels(@graph1))
  end

  def test_graph1_avg_per_level
    expected_avg_output = [4, 8, 6, 6, 2]
    assert_equal(expected_avg_output, DepthFirstTraverse.avg_per_level(@graph1))
  end

  def test_graph0_max_depth
    expected_max_depth = 4
    assert_equal(expected_max_depth, DepthFirstTraverse.max_depth(@graph1))
  end
end
