class Question

  attr_accessor :question
  attr_accessor :answer
  attr_reader :children
  attr_accessor :parent

  def initialize(answer, question, parent=nil)
    @parent = parent
    @question = question
    @answer = answer
    @children = []
  end


  def replace(other_question)
    @parent = other_question.parent
    @question = other_question.question
    @answer = other_question.answer
    @children = other_question.children
  end

  def correct?(candidate_answer)
    is_correct = @answer.eql? candidate_answer
    is_correct
  end

  def ask_all(&block)
    is_right = ask(&block)
    found = self
    if is_right && @children.size > 0
      @children.each do | child |
        result = child.ask_all(&block)
        found = result
        break if result.nil?
      end
    elsif is_right
      found = nil
    end
    found
  end

  def ask(&block)
    result = block.call(:question,@question)
    result = correct? result
    result
  end

  def <<(child)
    child.parent = self
    @children << child
  end

  def to_s
    return @question+"->"+@answer
  end

  def dump(offset=0)
    offset.times {|inc| print " "}
    puts to_s
    @children.each do |child|
      child.dump(offset+2)
    end
  end

end