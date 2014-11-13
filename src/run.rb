require_relative "mind_reader"

MindReader.new.begin {|state, prompt|
    pre = ""
    post = ""
    pre = "Is It" unless prompt.start_with? "Is It"
    post = "(y or n)" unless prompt.end_with? "(y or n)"
    puts "#{pre} #{prompt} #{post}"
    result = gets.strip
    result

}