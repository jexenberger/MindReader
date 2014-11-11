require_relative "tree"

class LeanMeanThinkingMachine
  # To change this template use File | Settings | File Templates.

  ROOT_QUESTION =  "think of an animal"



  def initialize
    tree = Tree.new(ROOT_QUESTION).child("Is it an Elephant?")
    puts tree.find_by_value ROOT_QUESTION

    @current_node = Tree.new(ROOT_QUESTION).child("Is it an Elephant?").find_by_value ROOT_QUESTION

  end

  def next_question
    question = @current_node.value
    return question
  end

  def post_answer(question, answer)
    question_node = @current_node.find_by_value question
    if answer.eql? 'n'
      hint = yield "You win. Help me learn from my mistake before you go...\nwhat animal were you thinking of?"
      hint_answer = yield "For a #{hint} what is the answer to your question? (y or n)"
      if hint_answer.eql? 'y'

      end

    end
    return nil
  end
end