require "test/unit"
require "../src/question"

class QuestionTest < Test::Unit::TestCase


  # Fake test
  def test_correct?
    assert Question.new("y","a test question").correct? "y"
    assert !(Question.new("y","a test question").correct? "qweqw")
  end

  def test_ask
    result = Question.new("y","a test question").ask {
        |question|  "y" if question.eql? "a test question"
    }
    assert_not_nil result
  end

  def test_ask_all
    root_question = Question.new("a","1")
    root_question << Question.new("b","2")
    root_question << Question.new("c","3")

    result = root_question.ask_all {|state,question|
      result = nil
      result =  "a" if question.eql? "1"
      result
    }
    #expect the first result to be something since we only got a result at the first level
    assert_not_nil result
    #expect the next line to be nil since we completed a line of questioning
    assert_nil root_question.ask_all {|state, question|
      result =  "a" if question.eql? "1"
      result = "b" if question.eql? "2"
      result
    }
    assert_nil root_question.ask_all {|state,question|
      result =  "a" if question.eql? "1"
      result = "c" if question.eql? "3"
      result
    }
    first_failure =  root_question.ask_all {|state,question|
      result = nil
      result = "x" if question.eql? "1"
      result
    }
    assert_not_nil first_failure
    assert_equal "a", first_failure.answer
    # all wrong
    second_failure = root_question.ask_all {|state,question|
      result =  "a" if question.eql? "1"
      result = "x" if question.eql? "2"
      result = "x" if question.eql? "3"
      result
    }
    assert_equal "c", second_failure.answer


  end
end