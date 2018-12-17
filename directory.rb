# let's put all the students into an array
# students = [
#   {name: "Dr. Hannibal Lecter", cohort: :november},
#   {name: "Darth Vader", cohort: :november},
#   {name: "Nurse Ratched", cohort: :november},
#   {name: "Michael Corleone", cohort: :november},
#   {name: "Alex DeLarge", cohort: :november},
#   {name: "The Wicked Witch of the West", cohort: :november},
#   {name: "Terminator", cohort: :november},
#   {name: "Freddy Kruger", cohort: :november},
#   {name: "The Joker", cohort: :november},
#   {name: "Joffrey Baratheon", cohort: :november},
#   {name: "Norman Bates", cohort: :november}
# ]


def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  name = gets.chomp
  # while the name if not empty, repeat this code
  while !name.empty? do
    # add the student hash to the array
    puts "Please enter your birth country."
    country = gets.chomp
    puts "Please enter your height in cm."
    height = gets.chomp
        students << {name: name, cohort: :november, country: country, height: height}
    puts "Now we have #{students.count} students"
    # get another name from the user
    name = gets.chomp
  end
  # return the array of students
  students
end

def print_header
  puts "The students of Villains Academy".center(60)
  puts "-------------".center(60)
end

def print(students)
  students_index = 0
  while students.length > students_index do
    puts "#{students[students_index][:name]} (#{students[students_index][:cohort]} cohort) is from #{students[students_index][:country]} and is #{students[students_index][:height]}cm.".center(60)
    students_index += 1
  end
end


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

def print_footer(students)
  puts "Overall, we have #{students.count} great students"
end


students = input_students
print_header
print(students)
# print_selected_letter(students)
# print_12_character(students)
print_footer(students)
