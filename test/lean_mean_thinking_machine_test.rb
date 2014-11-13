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
  def test_do_questioning
    puts LeanMeanThinkingMachine.new.do_questioning { |state, prompt|
      puts "#{state}:#{prompt}"
      result = nil
      result = 'n' if state.eql? :guess
      result = nil if state.eql? :begin
      result = 'a rabbit' if state.eql? :actual_thought
      result = 'Is it a small animal?' if state.eql? :actual_thought_hint
      result = 'y' if state.eql? :actual_thought_answer
      return result
    }
  end
end