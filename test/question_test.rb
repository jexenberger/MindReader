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
  def test_correct?
    assert Question.new("y","a test question").correct? "y"
    assert !(Question.new("y","a test question").correct? "qweqw")
  end

  def test_ask
    assert Question.new("y","a test question").ask { |question| return "y" if question.eql? "a test question"}
  end

  def test_ask_all
    question = Question.new("a","1")
    question << Question.new("b","2")
    question << Question.new("c","3")

    puts question.ask_all {|question| return "a" if question.eql? "1"}
    assert true
    assert question.ask_all {|question| return "b" if question.eql? "2"}
    assert question.ask_all {|question| return "c" if question.eql? "3"}
    assert !(question.ask_all {|question| return "x" if question.eql? "1"})
    assert !(question.ask_all {|question| return "x" if question.eql? "2"})
    assert !(question.ask_all {|question| return "x" if question.eql? "3"})

  end
end