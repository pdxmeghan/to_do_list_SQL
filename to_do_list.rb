require 'pg'
require './lib/task'

DB = PG.connect({:dbname => 'to_do'})

def main_menu
  loop do
    puts "[ == Task List Main Menu ==]"
    create_list
    # puts "[c] Create a new List"
    # puts "[l] View Lists"
    puts "[a] Add Tasks"
    menu_choice = gets.chomp
    if menu_choice == 'a'
      add_task
    elsif menu_choice == 'x'
      puts "Thanks."
      exit
    else
      puts "Choose again."
    end
  end
end

def create_list
@current_list = List.new("Stuff", 1)
end

def add_task
puts "\n\nEnter task for the list: "
task_choice = gets.chomp

end
