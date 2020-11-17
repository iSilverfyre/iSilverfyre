print "Please provide a number for x. "
num_x = gets.chomp

print "Please provide a number for y. "
num_y = gets.chomp

if num_x > num_y
  puts "#{num_x} is greater than #{num_y}!"
elsif num_x < num_y
  puts "#{num_x} is less than #{num_y}!"
else
  puts "#{num_x} equals #{num_y}!"
end