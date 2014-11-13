require "test/unit"
require "../src/mind_reader"

class MindReaderTest < Test::Unit::TestCase


  def prompt(message)
    puts message
    return gets.rstrip
  end

  def test_begin

    MindReader.begin { |step, prompt|
      return "y"
    }

  end

  def test_do_line_of_questioning
    question = Question.new("y", "is it an elephant")
    puts question
    MindReader.do_line_of_questioning(question) { |step, prompt|
      return "y"
    }
  end

end