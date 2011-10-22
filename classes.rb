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

# bang bang
my_message = "this is my new message"
puts my_message.delete("new ")
puts my_message

my_message.delete!("new ")
puts my_message

# Boolean methods and naming
class Dog
  def can_eat? food
    food == "dog food"
  end
end

my_dog = Dog.new
puts my_dog.can_eat? "cats"
puts my_dog.can_eat? "dog food"

# Classes & Setter Methods
class Dog
  def legs= number_of_legs
    @legs = number_of_legs
  end
end

my_dog = Dog.new
my_dog.legs= 3
p my_dog
