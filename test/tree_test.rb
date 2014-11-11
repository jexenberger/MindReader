require "test/unit"
require "../src/tree"

class TreeTest < Test::Unit::TestCase

  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    # Do nothing
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  # Fake test
  def test_new
      tree = Tree.new("start")
      assert_equal "start", tree.value
  end

  def test_find_by_value
    tree = Tree.new("start")
    subOne = tree.child "one"
    subTwo = tree.child "two"
    tree.child "three"

    subOne.child("hello").child("world")
    subTwo.child("uno").child("dos").child("tres")

    foundTree = tree.find_by_value("tres")
    assert_not_nil foundTree, "shoulda has a value"
    assert_equal "tres", foundTree.value

    foundTree = tree.find_by_value("world")
    assert_not_nil foundTree, "shoulda has a value"
    assert_equal "world", foundTree.value

    foundTree = tree.find_by_value("start")
    assert_not_nil foundTree, "shoulda has a value"
    assert_equal "start", foundTree.value

    foundTree = tree.find_by_value("hello")
    assert_not_nil foundTree, "shoulda has a value"
    assert_equal "hello", foundTree.value

  end

  def test_child
    tree = Tree.new("start").child "end"
    assert_equal "end", tree.value
  end
end