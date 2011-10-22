# while loop
square = 4
while square < 1000
  square *= square
  puts square
end

square = 4
begin
  square *= square
  puts square
end while square < 1000

square = 4
begin
  square *= square
  puts square

  break if square  == 256
end while square < 1000


# until loop
square = 4
until square > 512
  square *= square
  puts square
end

square = 4
until square > 512; square *= square; puts square end

square = 4
until square > 512 do square *= square; puts square end

# loop
square = 4
loop do
  square *= square
  break if square > 65536
  puts square
end



# iterators
3.times do
  puts "Ho!"
end

# for loop
cars = ["sedan", "station wagon", "4x4"]
for car in cars
  puts car
end


for i in 0..3
  puts i
end