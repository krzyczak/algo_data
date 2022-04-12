require "minitest/autorun"
require "minitest/reporters"

Minitest::Reporters.use!(
  Minitest::Reporters::ProgressReporter.new,
  ENV,
  Minitest.backtrace_filter
)

require_relative "../src/quick_sort.rb"

class TestGraphTraversal < MiniTest::Test
  def test_quick_sort_simple
    list_to_sort = [1234, 234, 1, 3, 8, 33, 3, 2, 1]
    expected_sorted_list = [1, 1, 2, 3, 3, 8, 33, 234, 1234]
    assert_equal(expected_sorted_list, QuickSort.simple(list_to_sort))
  end

  def test_quick_sort_simple_more_ruby
    list_to_sort = [1234, 234, 1, 3, 8, 33, 3, 2, 1]
    expected_sorted_list = [1, 1, 2, 3, 3, 8, 33, 234, 1234]
    assert_equal(expected_sorted_list, QuickSort.more_ruby(list_to_sort))
  end
end
