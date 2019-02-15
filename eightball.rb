require "pry"
require "colorize"

@answers = [ "Yes", "No", "Maybe", "Don't count on it", "Ask again later", "Most likely",
"Very doubtful", "I dont't know", "Not sure"]

@player_answers = ["Yes", "No", "Maybe", "Don't count on it", "Ask again later", "Most likely",
"Very doubtful", "I don't know", "Not sure"]

def menu
  puts "---- Ruby Magic Eightball ----".colorize(:cyan)
  puts "What would you like to do?".colorize(:green)
  puts "Select (1) To Ask The Magic Eightball A Question?".colorize(:green)
  puts "Select (2) To See All Answers?".colorize(:green)
  puts "Select (3) To Create A New Answer.".colorize(:green)
  puts "Or Type QUIT To Leave".colorize(:green)
  choose
end


def choose
  puts "------------------------------".colorize(:cyan)
  case gets.upcase.strip
  when "1"
    play_game
  when "2"
    display_answers
  when "3"
    create_answer
  when "QUIT"
    puts "See ya! Thanks for playing!"
    exit
  else
    puts "Invalid choice. Try Again."
    menu
  end
end

def play_game
  puts "------------------------------".colorize(:cyan)
  puts "Ask me a question if you dare:"
  gets.strip
  puts "------------------------------".colorize(:cyan)
  answer = @answers.sample
  puts answer
  puts "------------------------------".colorize(:cyan)
  menu
end

def display_answers
  @answers.each_with_index do |output, i|
    puts "#{i + 1}) #{output}"
  end
  puts "------------------------------".colorize(:cyan)
  menu
end


def menu2
  puts "------------------------------".colorize(:cyan)
  puts "Type (1) if you want to add more answers?".colorize(:green)
  puts "Type (2) if you want to ask a question?".colorize(:green)
  puts "Type (3) to see all answers including your answers.".colorize(:green)
  puts "Type EXIT if you want to go to main menu.".colorize(:green)
  puts "Type QUIT if you want to exit program.".colorize(:green)
  puts "------------------------------".colorize(:cyan)
  choose2
end

def choose2
  case gets.upcase.strip
  when "1"
    create_answer
  when "2"
    with_p_answers
  when "3"
    puts "------------------------------".colorize(:cyan)
    p_answers
  when "EXIT"
    menu
  when "QUIT"
    puts "See ya! Thank you!"
    exit
  else
   puts "Invalid Choice. Try Again."
    choose2
  end
end

def create_answer
  puts "------------------------------".colorize(:cyan)
  puts "What you like as an answer?"
  check_answer
end

def check_answer
  input = gets.capitalize.strip
   if @player_answers.include?(input) == true
    puts "Already exists. Try again."
    create_answer
   else 
    @player_answers << input
    puts "Answer added. Thank you."
   end
   menu2
end

def with_p_answers
  puts "Ask me a question if you dare:"
  gets.strip
  p_answer = @player_answers.sample
  puts p_answer
  menu2
end

def p_answers
  @player_answers.each_with_index do |op, i|
    puts "#{i + 1}) #{op}"
  end
  puts "------------------------------"
  menu2
end

menu

