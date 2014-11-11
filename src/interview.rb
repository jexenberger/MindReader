class Interview

  def initialize(interviewer)
    @interviewer = interviewer
  end


  def do_dialog
    begin
      question = @interviewer.next_question
      puts question
      answer = gets
      @interviewer.post_answer(question, answer)
    end until question.eql? "done"

  end

end