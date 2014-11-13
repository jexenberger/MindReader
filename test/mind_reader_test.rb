require "test/unit"
require "../src/mind_reader"

class MindReaderTest < Test::Unit::TestCase

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


  def prompt(message)
    puts message
    return gets.rstrip
  end

  # Fake test
  def test_begin

    MindReader.new.begin { |step, prompt|
      return "y"
    }

  end

  def test_process_branch
    question = Question.new("y", "is it an elephant")
    puts question
    MindReader.new.process_branch(question) { |step, prompt|
      return "y"
    }
  end

end