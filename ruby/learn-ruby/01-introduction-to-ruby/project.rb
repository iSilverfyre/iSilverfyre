print "What's your first name? "
first_name = gets.chomp
first_name.capitalize!

print "What is your last name? "
last_name = gets.chomp
last_name.capitalize!

print "What city do you live in? "
city = gets.chomp
city.capitalize!

print "What is the state you live in? (Please use the 2 letter abbriviation.) "
state = gets.chomp
state.upcase!

puts "Your name is #{first_name} #{last_name} and you live in #{city}, #{state}."