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

