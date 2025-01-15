def check_grade(grade)
  case grade
  when 1..5
    "elementary"
  when 6..8
    "Middle School"
  when 9..12
    "High School"
  else
    "college"
  end
end

puts "Enter the Grade : "
grade = gets.chomp.to_i

puts "Your Grade is #{check_grade(grade)}"

