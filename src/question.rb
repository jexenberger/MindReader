require_relative "tree"

class Question

  ROOT_QUESTION = "animal"

  attr_reader :guess
  attr_reader :guess_result
  attr_reader :guess_wrong
  attr_reader :actual_thought
  attr_reader :actual_thought_hint
  attr_reader :actual_thought_answer

  def initialize
    @tree = Tree.new ROOT_QUESTION
  end

  def begin
    yield(:begin, "think of an #{ROOT_QUESTION}")
  end


  def get_guess
    @guess = "elephant"
    return "is it an #{@guess}"
  end

  def guess
    @guess_result = yield(:guess, get_guess)
    @guess_result
  end

  def guess_wrong
    yield(:guess_wrong,"you win, help me learn from my mistake before you go...")
  end

  def actual_thought
    @actual_thought = yield(:actual_thought, "What #{ROOT_QUESTION} were you thinking of?")
  end

  def actual_thought_hint
    @actual_thought_hint = yield(:actual_thought_hint, "Give me a question to distinguish #{@actual_thought} from from an #{@guess}")
  end

  def actual_thought_answer
    @actual_thought_answer = yield(:actual_thought_answer, "For #{@actual_thought}, what is the answer to your question? (y or n)" )
  end


  def run_dialog(&block)
    self.begin &block
    guess_result = self.guess(&block)
    if guess_result.eql? 'n'
      guess_wrong &block
      actual_thought &block
      actual_thought_hint &block
      actual_thought_answer &block
      @tree.child(@actual_thought_hint).child(@actual_thought_answer).child(@actual_thought)
    end
    self
  end

  def dump
    @tree.print 0
  end


end