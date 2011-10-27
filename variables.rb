# Duck typing
# Ruby doesn't require strong typing like in languages like C++, C# and Java.
# Ruby is smart enough figure out the type of the variable.
# This is called Dynamic Typing or Duck Typing mean if it looks like a duck and waddles like a duck then it must be a duck

x = "this is a string"

puts x.class

x = 100

puts x.class

x = x.to_f

puts x.class

# Local

# Variables & Scope
# Global
$hates_fleas = true


# Class
class Dog
  @@count = 0

  def initialize(name)
    @name = name
    @@count += 1
  end

  def name
    @name
  end

  def Dog.count
    @@count
  end

end

rover = Dog.new("Rover")
snoopy = Dog.new("Snoopy")

puts rover.name
puts snoopy.name
puts "I have #{Dog.count} dogs"

# Instance & Local Variables
class Dog

  def initialize(name)
    @name = name
  end

  def name
    @name
  end
end

rover = Dog.new("Rover")
snoopy = Dog.new("Snoopy")

puts rover.name
puts snoopy.name

# Loops & Variable Scope