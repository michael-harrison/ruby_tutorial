# multiple assignment
a = b = c = 0
puts a,b,c

# parallel assignment
a,b,c = 1,2,3
puts a,b,c

a = 11
b = 22
temp = a
a = b
b = temp
puts "a:#{a}\n" + "b:#{b}\n"

a = 11
b = 22
a,b = b,a
puts "a:#{a}\n" + "b:#{b}\n"


a = a + 1
a += 1

a = a * 2
a *= 2

a = a - 1
a -= 1

