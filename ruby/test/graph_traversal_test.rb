require "minitest/autorun"
require "minitest/reporters"

Minitest::Reporters.use!(
  Minitest::Reporters::ProgressReporter.new,
  ENV,
  Minitest.backtrace_filter
)

require_relative "../src/node.rb"
require_relative "../src/depth_first_traverse.rb"
require_relative "../src/breadth_first_traverse.rb"

class TestGraphTraversal < MiniTest::Test
  def setup
    @francis = francis = Node.new("Francis")
    @larry = larry = Node.new("Larry")
    @debbie = debbie = Node.new("Debbie")
    @rajat = rajat = Node.new("Rajat")
    @ryan = ryan = Node.new("Ryan")
    @doug = doug = Node.new("Doug")
    @emily = emily = Node.new("Emily")
    @rebecca = rebecca = Node.new("Rebecca")
    @arnold = arnold = Node.new("Arnold")
    @richard = richard = Node.new("Richard")
    @gary = gary = Node.new("Gary")

    francis.connections = [larry, emily, gary]
    larry.connections = [debbie, doug, emily, francis]
    debbie.connections = [rajat, doug]
    rajat.connections = [debbie, ryan, doug]
    ryan.connections = [rajat]
    doug.connections = [larry, debbie, rajat]
    emily.connections = [rebecca, richard, gary, francis, larry]
    rebecca.connections = [arnold, richard, emily]
    arnold.connections = [richard, rebecca]
    richard.connections = [gary, emily, rebecca, arnold]
    gary.connections = [francis, emily, richard]

    @graph = francis
  end

  def test_graph_depth_first_traversal
    expected_traverse_output = [
      @francis,
      @larry,
      @debbie,
      @rajat,
      @ryan,
      @doug,
      @emily,
      @rebecca,
      @arnold,
      @richard,
      @gary
    ].map(&:value)

    # assert_equal(expected_traverse_output, DepthFirstTraverse.collect_iter(@graph))
    assert_equal(expected_traverse_output, DepthFirstTraverse.collect_multi_rec(@graph))
  end

  def test_graph_breadth_first_traversal
    # expected_traverse_output = [4, 7, 9, 10, 2, 6, 6, 2]
    # assert_equal(expected_traverse_output, BreadthFirstTraverse.collect(@graph))
  end
end
