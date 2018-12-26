@students = [] # an empty array accessible to all methods

def input_students
  puts "You've selected 1. Input the students."
  puts "Please enter the names of the students"
  puts "To finish, just hit return twice"
  # get the first name
  name = STDIN.gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    add_students(name)
    puts "Now we have #{@students.count} students"
    # get another name from the user
    name = STDIN.gets.chomp
  end
end

def interactive_menu
  loop do
    print_menu
    process(STDIN.gets.chomp)
  end
end

def print_menu
  puts "1. Input the students."
  puts "2. Show the students."
  puts "3. Save the list."
  puts "4. Load the list."
  puts "9. Exit."
end

def show_students
  print_header
  print_student_list
  print_footer
end

def save_students
  puts "What file would you like to save to?"
  filename = gets.chomp
  file = File.open(filename, "w")
  @students.each { |student|
    student_data = [student[:name], student[:cohort]].join(",")
    # csv_line = student_data.join(",") - REFACTORED by adding join above.
    file.puts student_data }
  file.close
  puts "Successfully saved!"
end

def load_students(filename = "students.csv")
  puts "What file would you like to load? Will default to students.csv if no input."
  filename = gets.chomp
  if filename.empty?
    file = File.open("students.csv", "r").readlines.each { |line|
      name, cohort = line.chomp.split(',')
      add_students(name, cohort.to_sym) }
    puts "students.csv loaded.  Choose option 2 to see the list."
  else
  file = File.open(filename, "r").readlines.each { |line|
    name, cohort = line.chomp.split(',')
    add_students(name, cohort.to_sym) }
  puts "#{filename} loaded.  Choose option 2 to see the list."
end
end

def add_students(name, cohort = :november)
  @students << {name: name, cohort: cohort.to_sym}
end

def try_load_students
  filename = ARGV.first # first argument from the command line
  return if filename.nil? # get out of the method if it isn't given
  if File.exists?(filename)
    load_students(filename)
    puts "Loaded #{@students.count} from #{filename}"
  else
    puts "Sorry, #{filename} doesn't exist."
    exit
  end
end

def process(selection)
  case selection
  when "1"
    input_students
  when "2"
    show_students
  when "3"
    save_students
  when "4"
    load_students
  when "9"
    exit
  else
    puts "I don't know what you meant, try again."
  end
end

def print_header
  puts "The students of Villains Academy"
  puts "-------------"
end

def print_student_list
  @students.each { |student|
    puts "#{student[:name]} (#{student[:cohort]} cohort)" }
end

def print_footer
  puts "Overall, we have #{@students.count} great students"
end


try_load_students
interactive_menu
