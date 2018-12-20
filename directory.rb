@students = [] # an empty array accessible to all methods

def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  name = gets.chop
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "Please enter your birth country."
    country = gets.chop
    puts "Please enter your height in cm."
    height = gets.chop
    puts "What cohort are you joining?"
    cohort = gets.chop.downcase
    cohort_list = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december", "unknown"]
    if cohort_list.include?(cohort)
      @students << {name: name, cohort: cohort.downcase.to_sym, country: country, height: height}
    elsif !cohort_list.include?(cohort)
      puts "We don't know that cohort you entered, would you like to try again?"
      cohort = gets.chop.downcase
      if cohort_list.include?(cohort)
        @students << {name: name, cohort: cohort.downcase.to_sym, country: country, height: height}
      else
        @students << {name: name, cohort: :unknown, country: country, height: height}
        break
      end
    end
    if @students.length > 1
      puts "Now we have #{@students.count} students."
    else
      puts "Now we have 1 student."
    end
    # get another name from the user
    name = gets.chop
  end
end

def interactive_menu
  loop do
    print_menu
    process(gets.chomp)
  end
end

def print_menu
  puts "1. Input the students."
  puts "2. Show the students."
  puts "3. Save the list to students.csv"
  puts "4. Load the list from students.csv"
  puts "9. Exit."
end

def show_students
  print_header
  print_students_list
  print_footer
end

def save_students
  file = File.open("students.csv", "w")
  @students.each do |student|
    student_data = [student[:name], student[:cohort]]
    csv_line = student_data.join(",")
    file.puts csv_line
  end
  file.close
end

def load_students
  file = File.open("students.csv", "r")
  file.readlines.each do |line|
    name, cohort = line.chomp.split(',')
    @students << {name: name, cohort: cohort.to_sym}
  end
  file.close
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
  puts "The students of Villains Academy".center(60)
  puts "-------------".center(60)
end

def print_students_list
  students_index = 0
  if @students.empty?
    puts "No students to print"
  else
    while @students.length > students_index do
      puts "#{@students[students_index][:name]} (#{@students[students_index][:cohort].capitalize} cohort) is from #{@students[students_index][:country]} and is #{@students[students_index][:height]}cm.".center(60)
      students_index += 1
    end
  end
end

def print_footer
  if @students.length == 0
    puts "We have no students"
  elsif @students.length > 1
    puts "Overall, we have #{@students.count} great students"
  else
    puts "We have 1 great student"
  end
end


interactive_menu



# students = input_students
# print_header
# print(students)
# # print_selected_letter(students)
# # print_12_character(students)
# print_footer(students)

# def print_selected_letter(students)
#   puts "What names would you like me to return by first-letter?"
#   letter = gets.chomp
#   students.each_with_index do |student, index|
#     if student[:name][0] == letter.upcase
#       puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
#     end
#   end
# end

# def print_12_character(students)
#   students.each_with_index do |student, index|
#     if student[:name].length <= 12
#       puts "#{index + 1}. #{student[:name]} (#{student[:cohort]} cohort)"
#     end
#   end
# end
