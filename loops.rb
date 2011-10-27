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

# break, next and redo
# next
cars = ["sedan", "station wagon", "4x4"]
for car in cars
  next if car == "station wagon"
  puts car
end

# break
cars = ["sedan", "station wagon", "4x4"]
for car in cars
  break if car == "station wagon"
  puts car
end

# redo
cars = ["sedan", "station wagon", "jalopy", "4x4"]
cars_started = 0
def start_car(car)
  started = true
  puts "starting #{car}"
  if (car == "jalopy")
    started = (rand(3) == 1)
  end

  started
end

for car in cars
  redo if !start_car(car)
  cars_started += 1
end

puts "started all cars"

