# if then else
dog_name = "rover"
if dog_name == "snoopy" then puts "That's Charlie's dog" else puts "Don't know who's dog that is" end

if dog_name == "snoopy"; puts "That's Charlie's dog" else puts "Don't know who's dog that is" end

dog_name = "snoopy"
if dog_name == "snoopy"
  puts "That's Charlie's dog" else puts "Don't know who's dog that is" end

dog_name = "snoopy"
puts "That's Charlie's dog" if dog_name == "snoopy"

dog_name = "amber"
if dog_name == "snoopy"
  puts "That's Charlie's dog"
elsif dog_name == "amber"
  puts "That's my dog"
end

dog_name = "rover"
if dog_name == "snoopy"
  puts "That's Charlie's dog"
elsif dog_name == "amber"
  puts "That's my dog"
else
  puts "Don't know who's dog that is"
end

# comparisons
dice_roll = 4
if dice_roll == 4; puts "That's on the money" end
if dice_roll != 4; puts "Try again" end
if dice_roll > 4; puts "That's too big" end
if dice_roll > 4 and dice_roll < 4  or dice_roll == 6; puts "Looks like it's not what we want" end



# unless
dog_name = "snoopy"
unless dog_name != "snoopy"
  puts "That's Charlie's dog"
end

dog_name = "freddy"
unless dog_name != "snoopy"
  puts "That's Charlie's dog"
else
  puts "Don't know who's dog that is"
end

dog_name = "freddy"
puts "That's Charlie's dog" unless dog_name != "snoopy"

dog_name = "snoopy"
puts "That's Charlie's dog" unless dog_name != "snoopy"

# ternary operator
dog_name = "snoopy"
puts dog_name == "snoopy" ? "That's Charlie's dog" : "Don't know who's dog that is"

dog_name = "rover"
puts dog_name == "snoopy" ? "That's Charlie's dog" : "Don't know who's dog that is"

# Using the if statement return ability
weather = "raining"

ground_feels =
    if weather == "raining"; "wet"
    elsif weather == "sunny"; "dry"
    else "don't know"
    end

puts ground_feels

weather = "sunny"

ground_feels =
    if weather == "raining"; "wet"
    elsif weather == "sunny"; "dry"
    else "don't know"
    end

puts ground_feels

# case statement
weather = "sunny"

ground_feels =
    case
      when weather == "raining"; "wet"
      when weather == "sunny"; "dry"
      else "don't know"
    end

puts ground_feels

