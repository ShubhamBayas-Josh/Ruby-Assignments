def is_prime(num) 
  return false if num <= 1

  (2..Math.sqrt(num)).each do |i|
    if num % i == 0
      return false
    end
  end
  
  true
end

puts "Enter a Number : "
number = gets.to_i

if is_prime(number)
  puts "#{number} is a prime number."
else
  puts "#{number} is not a prime number"
end
