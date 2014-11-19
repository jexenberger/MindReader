#this class wraps a question by having both a question and answer provided.
#although the program requirement has only y or no as answers, this structure caters for both.
#furthermore this class models a tree by keeping the relation to it's parent and it's children
#it also provides methods to facilitate questioning
#This class demonstrates the following SOLID principles
#1. Single responsibility pattern:
#   This class has a single responsibility of handling and modelling quesiton domain data
#2. Dependency Inversion principle
#   This class uses Ruby blocks as an abstraction mechanism for triggering question. This allows the class to no depend on System In and System out to capture questions

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
      @children.reverse.each do | child |
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

  def apply_learning(question)
    if self.parent.nil?
      self.replace question
    elsif
      self.parent << question
    end
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