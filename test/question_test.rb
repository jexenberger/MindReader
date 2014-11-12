require "test/unit"
require "../src/question"

class QuestionTest < Test::Unit::TestCase

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
  def test_run_dialog
     question = Question.new.run_dialog do |state, prompt|
       puts "#{prompt}"
       result = nil
       result = "n" if state == :guess
       result = "a rabbit" if state == :actual_thought
       result
     end
     Question.new.run_dialog do |state, prompt|
       puts "#{prompt}"
       result = nil
       result = "y" if state == :guess
       result
     end
     question.dump

  end
end