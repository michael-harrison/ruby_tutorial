
[1,2,3,4].each do |value|
  puts value
end

[1,2,3,4].each {|value| puts value}

File.open_and_process("hello.rb", "r") do |file|
  while line = file.gets
    puts line
  end
end

# variable scope
sheep = 20
1.upto(50) do |sheep|
  puts sheep
end
puts sheep

sheep = 20
name = "shaun"
1.upto(50) do |sheep|
  puts sheep
  name = "fred"
end
puts sheep

sheep = 20
name = "shaun"
1.upto(50) do |sheep; fred|
  puts sheep
  name = "fred"
end
puts sheep

# yield
def test
   puts "You are in the method"
   yield
   puts "You are again back to the method"
   yield
end
test {puts "You are in the block"}

def test_with_parameters
   puts "You are in the method"
   yield 10, 10
   puts "You are again back to the method"
   yield 100
end
test_with_parameters {|i,j| puts "You are in the block #{i} #{j}"}


# BEGIN and END
# Any code that found by Ruby in the BEGIN block is run before any other code
# Similarly any code in the END block will be run last
# If there are multiple BEGIN and ENDs then they are run in the sequence that they're found by Ruby

BEGIN {
   # begin block code
}

END {
   # end block code
}
