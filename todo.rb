# todo.rb
require "tty-prompt"

# Define the empty array to store tasks
tasks = []

# Method to display all tasks
def display_tasks(tasks)
  puts "\nYour To-Do List:"
  tasks.each_with_index do |task, index|
    puts "#{index + 1}. #{task}"
  end
  puts "\n"
end

# Initialize the prompt
prompt = TTY::Prompt.new

# Main loop for the application
loop do
  puts "Choose an option:"
  puts "1. Add task"
  puts "2. View tasks"
  puts "3. Mark task as completed"
  puts "4. Remove task"
  puts "5. Exit"

  choice = prompt.ask("Enter the option number:")

  case choice.to_i
  when 1
    task = prompt.ask("Enter the task:")
    tasks << task
    puts "Task added: #{task}"
  when 2
    display_tasks(tasks)
  when 3
    display_tasks(tasks)
    task_number = prompt.ask("Enter the task number to mark as completed:", convert: :int)
    if task_number > 0 && task_number <= tasks.length
      tasks[task_number - 1] += " [completed]"
      puts "Task marked as completed."
    else
      puts "Invalid task number."
    end
  when 4
    display_tasks(tasks)
    task_number = prompt.ask("Enter the task number to remove:", convert: :int)
    if task_number > 0 && task_number <= tasks.length
      tasks.delete_at(task_number - 1)
      puts "Task removed."
    else
      puts "Invalid task number."
    end
  when 5
    puts "Goodbye!"
    break
  else
    puts "Invalid choice. Please try again."
  end
end

# Save tasks to a file
File.open("tasks.txt", "w") do |file|
  tasks.each do |task|
    file.puts task
  end
end
