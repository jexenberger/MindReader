require_relative "tree"
require_relative "question"

class LeanMeanThinkingMachine
  # To change this template use File | Settings | File Templates.

  ROOT_QUESTION = "animal"

  def initialize
    @tree = Tree.new(ROOT_QUESTION)
  end

  def do_questioning(&block)
    again = 'y'
    begin
      question = Question.new(@tree.value).run_dialog(&block)
      if (question.guessed_correct?)
        puts "NOT CORRECT!!!"
        question.each_child do |child|
          question = Question.new(child.value).run_dialog(&block)
          if (!question.guessed_correct?)
            child
              .child(question.actual_thought_hint)
              .child(question.actual_thought_answer)
              .child(question.actual_thought)
          end
        end
      end
      again = block.call(:continue, "Play again? (y or n)")
    end until again.eql? 'n'
  end


end