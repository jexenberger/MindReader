#this class simply drives interaction with the user.
#Is is solely responsible for driving user interaction, delegating atual questioning to the Question pattern, again showing SRP and DIP

require_relative "question"

class MindReader

  def self.read_mind(&block)
    questions = Question.new("y", "an elephant")
    begin
      do_line_of_questioning(questions, &block)
    end until block.call(:again,"Play again (y or n)").eql? 'n'

  end

  def self.do_line_of_questioning(question, &block)

    result = question.ask_all(&block)
    if !result.nil?
      new_questions =  learn_new(result, &block)
      result.apply_learning(new_questions)
    elsif
      puts "I win. Pretty smart aren't I"
    end
  end

  def self.learn_new(root_question, &block)
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

