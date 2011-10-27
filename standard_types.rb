# Strings
# Are generally filled with characters but can also hold binary data
# In 1.9 strings are character based rather than byte based (ala 1.8.7) allowing for multi-byte character sets
# (eg UTF-16, UTF-18) and a whole heap of encodings
Encoding.list.each {|encoding| puts encoding.name}
# This effects things like what's returned from indexes of the string and the length of the string
# String#each is no more in 1.9. Use #each_line and #lines instead
# To move through a string you can use #each_byte, #each_char or #each_codepoint
# referencing the characters no longer produces the byte value but the actual string
"abc"[0] # in 1.8.7 => 97, in 1.9 => "a"
# They're objects based on the String class
?a # in 1.8.7 => 97, in 1.9 => "a"
"a".ord # in 1.8.7 => error, in 1.9 => 97

# ruby 1.9 has #getbyte and #setbytes to directly inspect and manipulate bytes in a string
"abc".getbyte(0) # in 1.8.7 => error, in 1.9 => 97

# clearing a string
a = "" # 1.8.7
a.clear # 1.9

# Creating a string
my_string = "this is my string using a literal method"
puts my_string

my_string = String.new("this is my string using the new method")
puts my_string

# Creation using string literals
my_string = %q/general single-quoted string/
puts my_string

my_string = %Q!general double-quoted string!
puts my_string

my_string = %Q{Seconds/day: #{24*60*60}}
puts my_string

# In fact the Q is optional
my_string = %!general double-quoted string with no Q!
puts my_string

my_string = %{Seconds/day: #{24*60*60} with no Q}
puts my_string

my_string = %{#{a=1;b=2;a+b}}
puts "The total is " + my_string

# Creating a multi line string
my_string = <<STRING_BLOCK
    this is my multi-line string which
    is encapsulated by the my keyword
    followed by the '<<' literal
STRING_BLOCK

puts my_string

my_string =
"    this is my multi-line string which
    is encapsulated by double quotes"

puts my_string

# Escaping characters in strings
# There are heaps of escape sequences but here's just a few
puts "This is a double quote: \""
puts 'This is a single quote: \''
print "This has an end of line \n"

# Quotes and strings
colour = "brown "
message = "my dog is #{colour}"
puts message
message = 'my dog is #{colour}'
puts message

message = "my dog is #{colour * 3}"
puts message

message = "there are #{24*60*60} seconds in a day"
puts message

# String concatenation
my_string = 'Con' + "cat" + 'en' + "ated" + " " + "string"
puts my_string

my_string = 'Con' "cat" 'en' "ated" " " "string"
puts my_string

# Working with Strings
# There are more than 100 methods for the String class in Ruby making it one of the biggest classes
# Here are just a few of them
columns = "Jack Jackson\tJack\tJackson"
full_name, first_name, last_name = columns.split(/\t/)
puts "My name is #{full_name}"
puts "My first name is #{first_name}"
puts "My last name is #{last_name}"

print "This is a message\n".chomp + "that had a newline in the middle of it\n"

puts "squeeze       me".squeeze!(' ')

scores = "21 42 23"
first_number, second_number, third_number = scores.scan(/\d+/)
puts first_number
puts second_number
puts third_number

array_of_scores = scores.scan(/\d+/)
p array_of_scores

# unpack & blocks
"abc".unpack("c*")
"abc".unpack("c*") {|i| puts i}

# encoding
"açd".encoding.name
"açd".encode("iso-8859-1").bytes.to_a
"açd".encode("iso-8859-1").encode("utf-8")

"化ける".encoding.name
"化ける".length
"化ける".bytesize
# 化ける translates to "to change form"
# For encoding throughout you code file use
# encoding: utf-8



# Numbers
# Number Classes
# Fixnum
# Bignum
number = 123456
puts number.class
number = 123456789123456789123456789123456789
puts number.class

# Writing numbers
number = 123456
number = 0xFEAA67 # Hexadecimal
number = 7_3999_1234 # Underscores are ignored
number = -200 # Negative number
number = 0b0101_1101 # Binary number
number = 2.0 #

# Complex & Rational numbers
three_quarters = Rational(3, 4)
two_thirds = Rational("2/3")
puts three_quarters * two_thirds

point_1 = Complex(1, 2)
point_2 = Complex("3+4i")
puts point_1 * point_2

# String to numbers
puts Integer("5")
#puts Integer("5 days") # This will fail

# Looping with numbers
4.times {print"X"}
1.upto(5) {|i| print i,""}
99.downto(95) {|i| print i, " " }
50.step(80, 5) {|i| print i, " " }

# Ranges
# Ranges as intervals
numbers = (1..10).to_a
puts numbers

alphabet = ('a'..'z').to_a
print alphabet
puts

string_sequence = ('ba'..'cx').to_a
print string_sequence
puts

require 'date'
span = DateTime.new(1776, 7, 2, 1, 30, 15)..DateTime.new(1776, 7, 4, 7, 0, 0)
span.each { |x| puts x }

# inclusive ranges
number = 5
range = 1..10
puts "your number is between 1 and 10" if range.include?(number)

number = 25
puts "your number is between 1 and 10" if range.include?(number)

# exclusive range
range = 1...10
puts "1 is in the range" if range.include?(1)
puts "5 is in the range" if range.include?(5)
puts "10 is in the range" if range.include?(10)

range = 1...10
puts "The lower end of the range is #{range.min}"
puts "The upper end of the range is #{range.max}"

# something cool
range = 1...10
puts range.reject { |i| i < 5 }

# Use in conditions
# Using the equality operator()
puts "Number 5 is in the range 1 to 10" if 1..10 === 5
puts "3.14159 is in the range 1 to 10" if 1..10 === 3.14159
puts "'c' is in the range a to z" if 'a'..'z' === 'c'

# case
print "How many meters to the shop? "
meters_to_the_shop = gets.to_f
case meters_to_the_shop
  when 0...1
    puts "We're already there"
  when 1...20
    puts "That's not too far to walk"
  when 20...500
    puts "That's a bit of a walk sure you want to go?"
  when 500..2000
    puts "That's too far to walk lets eat in"
end
