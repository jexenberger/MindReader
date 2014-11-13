require_relative "question"
require_relative "tree"

class MindReader

  def begin(&block)
    questions = Question.new("y", "is it an elephant")
    play_again = 'y'
    begin
     process_branch(questions, &block)
    end until block.call("Play again").eql? 'n'

  end

  def process_branch(question, &block)
    result = question.ask_all(&block)
    if result.nil?
      return process_question(question, &block)
    end
  end

  def process_question(question, &block)
    puts "You win. Help me learn from my mistake before you go..."
    answer = block.call(:actual_thought, "what animal were you thinking of?")
    question = block.call(:distinguishing_question, "Give me a question to help distinguish #{answer} from #{question.question}")
    question_answer = block.call(:answer, "For a #{answer}, what is the answer to your question")
    questions = Question.new("y", question)
    questions << Question.new(question_answer, "Is It "+answer)
    return questions
  end


end

