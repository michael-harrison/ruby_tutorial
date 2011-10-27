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

