# exercise 7 outstanding:  What if the user makes a typo?

def input_students
  puts "Please enter the name of the student"
  puts "To finish, just hit return twice"
  # create an empty array
  students = []
  name = gets.chomp
  # while the name is not empty, repeat this code
  while !name.empty? do
    puts "Please enter your birth country."
    country = gets.chomp
    puts "Please enter your height in cm."
    height = gets.chomp
    puts "What cohort are you joining?"
    cohort = gets.chomp.downcase
    cohort_list = ["january", "february", "march", "april", "may", "june", "july", "august", "september", "october", "november", "december", "unknown"]
    if cohort_list.include?(cohort)
      students << {name: name, cohort: cohort.downcase.to_sym, country: country, height: height}
    elsif !cohort_list.include?(cohort)
      puts "We don't know that cohort you entered, would you like to try again?"
      cohort = gets.chomp.downcase
      if cohort_list.include?(cohort)
        students << {name: name, cohort: cohort.downcase.to_sym, country: country, height: height}
      else
        students << {name: name, cohort: :unknown, country: country, height: height}
        break
      end
    end
    if students.length > 1
      puts "Now we have #{students.count} students."
    else
      puts "Now we have 1 student."
    end
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
    puts "#{students[students_index][:name]} (#{students[students_index][:cohort].capitalize} cohort) is from #{students[students_index][:country]} and is #{students[students_index][:height]}cm.".center(60)
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
  if students.length > 1
    puts "Overall, we have #{students.count} great students"
  else
    puts "We have 1 great student"
  end
end


students = input_students
print_header
print(students)
# print_selected_letter(students)
# print_12_character(students)
print_footer(students)
