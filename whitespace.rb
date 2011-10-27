# Semicolons
# semicolons are optional
a = 10; # or...
a = 10

#  However semicolons need be used when having many statements on one line
a = 10
b = 20
c = 30

a = 10; b = 10; c = 30

# Statements over multiple lines
# Ruby will stop parsing a line if it feels it has a complete statement
first_word = "star "
second_word = "wars\n"

print ">"
print first_word + second_word

print ">"
print first_word + # this is the first part of the phrase
second_word

# The Backslash
# You can use backslashes to get th same effect however the backslash is sensitive to any text after it
# For examples, the following will fail

# Example with a comment after a backslash
print ">"
print first_word \ # this is the first part of the phrase
+ second_word

# Example with a space after the backslash
print ">"
print first_word \
+ second_word

# Following is the right way where the backslash has a new line character directly after it
print ">"
print first_word \
+ second_word

# The Full Stop
#

puts "Repeat it twice:"
2.times {}