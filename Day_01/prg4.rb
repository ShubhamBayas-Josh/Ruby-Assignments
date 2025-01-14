def validate_mobile(number)
  regex = /^(?:\+91[-\s]?)?\d{10}$/
  if number.match?(regex)
    puts "#{number} is a valid number"
  else
    puts "#{number} is not a valid number"
  end
end

def valid_gender(gender)
  regex = /^[MF]$/
  if gender.match?(regex)
    puts "#{gender} is a valid gender"
  else
    puts "#{gender} is not a gender"
  end
end

def valid_amount(amount)
  regex = /^\d+$/
  if amount.match?(regex)
    puts "#{amount} is valid Amount"
  else
    puts "#{amount} is invalid Amount"
  end
end

def valid_email(email)
  regex = /^[A-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$/
  if email.match?(regex)
    puts "#{email} is a valid email address"
  else
    puts "#{email} is not a valid email address"
  end
end

def valid_name(name)
  regex = /^[A-Za-z]+$/
  if name.match?(regex)
    puts "#{name} is a valid first name"
  else
    puts "#{name} is not a valid first name"
  end
end

puts "Enter Mobile Number"
number = gets.chomp

puts "Enter Gender (M/F)"
gender=gets.chomp

puts "Enter Amount :"
amount = gets.chomp

puts "Enter Email Address:"
email = gets.chomp

puts "Enter First Name:"
first_name = gets.chomp

valid_name(first_name)
valid_email(email)
validate_mobile(number)
valid_gender(gender)
valid_amount(amount)

