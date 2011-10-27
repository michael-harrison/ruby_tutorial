# ---------------
# Array Creation

array_by_new = Array.new
array_by_brackets = []

array_by_brackets = [1,2,3,4,5]
print "array_by_brackets:"; array_by_brackets.each { |element| print "[#{element}]" }
puts

array_by_new = Array.new(5)
print "array_by_new:"; array_by_new.each { |element| print "[#{element}]" }
puts

array_by_new = Array.new(5) { |element| element+1 }
print "array_by_new:"; array_by_new.each { |element| print "[#{element}]" }
puts

#string array with single quote format without the quotes
array_without_quotes = %w[this\n is\n a\n magic\n trick\n]
print "array_without_quotes:"; array_without_quotes.each { |element| print "[#{element}]" }

#string array with double quote format without the quotes
array_without_quotes = %W[this\n is\n a\n magic\n trick\n]
print "array_without_quotes:"; array_without_quotes.each { |element| print "[#{element}]" }

# copying an array
source = [1,2,3]
destination = Array.new(source)
source.clear
print "source:"; source.each { |source| print "[#{element}]" }
puts
print "destination:"; destination.each { |element| print "[#{element}]" }
puts

# mixed arrays
mixed_array = [[1,2,3], "mixed", 0..2, "berries", 3, :pop_song, {}]
mixed_array.each { |element| print "[#{element}]" }
puts

# sorting an array
p [7,2,1,4,6].sort
p [7,2,1,4,6].sort.reverse

# appending elements to an array
some_numbers = [2,54,3,2]
some_numbers << 45
p some_numbers

# ---------------
# Array Accessing

fruits = ["apple", "pear", "orange", "banana", "rock mellon"]
puts "first with function: " + fruits.first()
puts "first with index: " + fruits[0]
puts "first with negative index: " + fruits[-5]
puts "first two: "; puts fruits.first(2)
puts "last: " + fruits.last
puts "last two: "; puts fruits.last(2)
puts "position 2: " + fruits.at(2)

# sections of arrays
puts "the middle:"; puts fruits[2,4]
puts "the middle with range:"; puts fruits[2..4]
puts "the middle with slice & range:"; puts fruits.slice(2..4)

# index of values
puts "index of the orange: #{fruits.index('orange')}"
puts "index of the orange with block: #{fruits.index{|fruit| fruit == 'orange' }}"

puts "is there an apple in this array: #{fruits.include?('apple')}"
puts "is there an peach in this array: #{fruits.include?('peach')}"

# ---------------
# Array Manipulation



# ---------------
# Changes in 1.9
fruits = ["apple", "pear", "orange", "banana", "rock mellon"]
fruits.choice # no longer exists
fruits.sample(2) # replaces it
fruits.uniq {|v| v =~ /g/}
# NB: #product also now supports a block
[1,2,3,4,5].inject(:+) # handy trick for 1.8.7 and 1.9.2/3

