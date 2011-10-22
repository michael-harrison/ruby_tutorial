# ------------------
# Methods
# ------------------

# Simple Method
def say
  puts "hello"
end

say

# Brackets or no brackets
def say_with_brackets(message)
  puts message
end

say_with_brackets("hello with brackets")

def say_without_brackets message
  puts message
end

say_without_brackets "hello without bracket"

# Return or no return
def say_with_return message
  return message
end

puts say_with_return "many happy returns"

def say_without_return message
  message
end

puts say_without_return "who needs to return"

# Multiple parameters for a method
def say_lots *messages
  messages.each do |message|
    puts message
  end
end

say_lots "dog sees cats", "dog chases cat"

# parameter defaults
def dog_says message="bark"
  puts message
end

dog_says
dog_says "yelp"

# method aliases
def speak_it message
  puts message
end

alias say_it speak_it
say_it "can you hear me"



