require 'pg'
require './lib/task'
require './lib/list'

DB = PG.connect({:dbname => 'to_do'})

def main_menu
  loop do
    puts "[ == Task List Main Menu ==]"
    puts "[z] clear the databases"
    puts "[c] Create a new List"
    # puts "[l] View Lists"
    puts "[a] Add Tasks"
    puts "[x] Exit home"
    puts "[l] List Tasks"
    menu_choice = gets.chomp
    if menu_choice == 'a'
      add_task
    elsif menu_choice == 'c'
      create_list
    elsif menu_choice == 'l'
      list_tasks
    elsif menu_choice == 'z'
       detonate
    elsif menu_choice == 'x'
      puts "Thanks."
      exit
    else
      puts "Choose again."
    end
  end
end

def create_list
List.new("Stuff",1).save
@current_list = List.all.last
puts "Happiness is: #{@current_list.name}"
end

def add_task
puts "\n\nEnter task for the list: "
task_choice = gets.chomp
saved_task = Task.new(task_choice, @current_list.id).save

end

def list_tasks
  Task.all.each do |task|
    puts task.name
  end
end

def detonate
  DB.exec("DELETE FROM tasks *;")
  DB.exec("DELETE FROM lists *;")
end

main_menu
