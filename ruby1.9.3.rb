=begin
loading with lots of gems and files can be slower due to a bug in 1.9.3 however there is a fix out which then
brings the load time into some more respectable: 36% faster than 1.9.2

You can modify garbage collection parameters for tuning at the command line

Path name and Date libraries have been reimplemented in C for performance
=end

# Random numbers
#1.9.2
Random.new.rand(1..10)

#1.9.3
Randmom.rand(1..10)
rand(1..10)

# Time
# Time Zones
# 1.9.2
Time.now.strftime("%b %d, %Y")

#1.9.3
Time.now.strftime("%b %d, %Y %z %:z %::z")

# String
# Prepend

"button".prepend("push the ")
"button".byteslice(3..5)
"button".byteslice(3,3)

# Ripper (used for parsing through ruby code) is now closer to powering a full ruby implementation

# New standard library called io/console which adds console manipulation methods to io instances

# License change from GPL V2 license to 2-clause BSD license

# OpenSSL is getting some much needed TLC with new maintainers

# New encodings including UTF-16, UTF-32, cp950 and cp951

# Null constant for File
File::NULL

# Lots of improvements on the Matrix libraries

# net/http library now support the 100 status which is "Continue".  Used when you want to tell the remote to continue sending

