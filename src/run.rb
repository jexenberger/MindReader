require_relative "mind_reader"

MindReader.read_mind {|state, prompt|
    pre = ""
    post = ""
    pre = "Is It" if (state.eql? :question) && (!prompt.strip.downcase.start_with?("is it"))
    post = "(y or n)" if state.eql? :question
    puts "#{pre} #{prompt} #{post}"
    result = gets.strip
    result

}