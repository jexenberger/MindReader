require "test/unit"
require "../src/interview"

class MyTest < Test::Unit::TestCase


  # Called before every test method runs. Can be used
  # to set up fixture information.
  def setup
    @cnt = 1
  end

  # Called after every test method runs. Can be used to tear
  # down fixture information.

  def teardown
    # Do nothing
  end

  def post_answer(question, answer)
    puts "the answer to the question: #{question} -> #{answer}"
  end

  def next_question
    puts @cnt
    @cnt  += 1
    if @cnt == 5
      return "done"
    end
    "what is your name"
  end

  # Fake test
  def test_do_dialog
    interview = Interview.new self
    interview.do_dialog
  end
end