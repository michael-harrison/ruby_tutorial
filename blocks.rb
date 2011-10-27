
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