class QuestionDialog
  # To change this template use File | Settings | File Templates.

  def do_dialog

  end

  def wrong_answer_dialog(right_animal)
    puts "what kind of animal were you thinking of"
    animal = get
    puts "give me a question to distinguish a #{animal} from a #{right_animal}"
    animal_question = gets

  end

end