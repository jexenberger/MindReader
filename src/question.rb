class Question

  attr_accessor :question
  attr_reader :answer
  attr_reader :children

  def initialize(answer, question)
    @question = question
    @answer = answer
    @children = []
  end


  def correct?(candidate_answer)
    is_correct = @answer.eql? candidate_answer
    puts is_correct
    return is_correct
  end

  def ask_all(&block)
    is_right = ask(&block)
    found = self
    if (is_right && @children.size > 0)
      @children.each do |child|
        found = child.ask_all(&block)
      end
    elsif (is_right)
      found = nil
    end
    return found
  end

  def ask(&block)
    return correct? block.call( @question)
  end

  def <<(child)
    @children << child
  end

  def to_s
    return @question+"->"+@answer
  end

end