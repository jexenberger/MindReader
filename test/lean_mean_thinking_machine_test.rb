require "test/unit"
require "../src/lean_mean_thinking_machine"
require "../src/tree"

class LeanMeanThinkingMachineTest < Test::Unit::TestCase

  :animals
  :you

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
  def test_next_question
    puts LeanMeanThinkingMachine.new.next_question
  end
end