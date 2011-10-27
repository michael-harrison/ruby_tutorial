# class instance (aka object)
my_string = String.new("This is my string")

# initialising classes
class Car
  def initialize (colour, model, cylinders)
    @colour = colour
    @model = model
    @cylinders = cylinders
  end
end

nissan = Car.new("burgundy", "x-trail", 4)
p nissan

# Getter Methods
class Car
  def colour
    @colour
  end

  def model
    @model
  end

  def cylinders
    @cylinders
  end
end

nissan = Car.new("burgundy", "x-trail", 4)
puts nissan.colour
puts nissan.model

# Setter Methods
class Dog
  def legs= number_of_legs
    @legs = number_of_legs
  end
end

my_dog = Dog.new
my_dog.legs= 3
p my_dog

# Shorted Getter & Setters
class SportsCar
  attr_reader :model, :cylinders
  attr_accessor :colour

  def initialize (colour, model, cylinders)
    @colour = colour
    @model = model
    @cylinders = cylinders
  end
end

lamborghini = SportsCar.new("green", "Gallardo LP 560-4", 10)
puts lamborghini.colour
lamborghini.colour = "red"
puts lamborghini.colour
puts lamborghini.model
puts lamborghini.cylinders

# Boolean Methods
class Dog
  def can_eat? food
    food == "dog food"
  end
end

my_dog = Dog.new
puts my_dog.can_eat? "cats"
puts my_dog.can_eat? "dog food"

# bang bang
my_message = "this is my new message"
puts my_message.delete("new ")
puts my_message

my_message.delete!("new ")
puts my_message

# public, private and protected attributes & inheritance

# private & public attributes
class Book
  def initialize(wholesale, markup_percentage)
    @wholesale = wholesale
    @markup_percentage = Float(markup_percentage/100)
  end

  def can_purchase(available_funds)
    calculate_sell_price <= available_funds
  end

  def calculate_sell_price
    markup_amount = @wholesale * @markup_percentage
    @wholesale += markup_amount
  end

  private :calculate_sell_price
end

book = Book.new(45, 25)
puts "you have enough dollars to buy this book" if book.can_purchase(100)

# protected attributes
class Person
  attr_reader :age
  protected :age

  def initialize(age)
    @age = age
  end

  def age_difference_with(other_person)
    (self.age - other_person.age).abs
  end

end

fred = Person.new 34
chris = Person.new 25
puts chris.age_difference_with fred
#puts chris.age

# inheritance & method overriding
class Person
  attr_reader :name

  def initialize(name)
    @name = name
  end
end

class Doctor < Person
  def name
    "Dr. " + super
  end
end

doctor = Doctor.new("Sam Parker")
puts doctor.name

patient = Person.new("Jack James")
puts patient.name

# overriding operators
class Song
  def initialize
    @plays = 0
  end

  def <<(play)
    @plays += play
    self
  end

  def plays
    @plays
  end
end

my_song = Song.new
my_song << 10 << 20 << 30
puts my_song.plays

# mix and match with Modules
module Spoon
  attr_accessor :capacity

  def initialize(capacity)
    @capacity = capacity
  end

end

module Fork
  attr_accessor :tines

  def initialize(tines)
    @tines = tines
  end

end

class Spork
  include Spoon
  include Fork

  def initialize (capacity, tines)
    @capacity = capacity
    @tines = tines
  end

end

utensil = Spork.new("25 mls", 3)
p utensil

# classes & variables
person1_first_name = "Rob"
person2_first_name = person1_first_name
person2_first_name[0] = "B"
puts person1_first_name
puts person2_first_name

person1_first_name = "Rob"
person2_first_name = person1_first_name.dup
person2_first_name[0] = "B"
puts person1_first_name
puts person2_first_name

# stopping modifications
person2_first_name = person1_first_name
person1_first_name.freeze
person2_first_name[0] = "B"


