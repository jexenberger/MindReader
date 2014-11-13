require_relative "question"
require_relative "tree"

class MindReader

  def begin(&block)
    questions = Question.new("y", "an elephant")
    begin
      process_branch(questions, &block)
    end until block.call(:again,"Play again (y or n)").eql? 'n'

  end

  def process_branch(question, &block)

    result = question.ask_all(&block)
    if !result.nil?
      new_questions =  process_question(result, &block)
      if result.parent.nil?
        question.replace new_questions
      elsif
        result.parent << new_questions
      end
    elsif
      puts "I win. Pretty smart aren't I"
    end
  end

  def process_question(root_question, &block)
    puts "You win. Help me learn from my mistake before you go..."
    answer = block.call(:actual_thought, "what animal were you thinking of?")
    question = block.call(:distinguishing_question, "Give me a question to help distinguish #{answer} from #{root_question.question}")
    begin
      question_answer = block.call(:answer, "For #{answer}, what is the answer to your question? (y or n)")
    end until (question_answer.eql?("y") || question_answer.eql?("y"))
    questions = Question.new("y", question)
    questions << Question.new(question_answer, answer)
    puts "Thanks"
    return questions
  end


end

