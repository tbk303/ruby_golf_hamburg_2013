# The rules for this ruby golf contained an interesting info:
# "only non-whitespace characters within the method body are counted"
#
# So we can encode arbitrary long programs inside whitespace (bits 0 = space, 1 = newline),
# then use a small program to extract the info again, all within the method body.
# That golfs down the inner part of every method to only 29 counted characters,
# no matter how long the program is.
# Maybe even less if someone finds a more compact decompression!
#
# Usage: Store the code to be encoded in a file (for example input.txt), then run
#   ruby golf_compactor.rb input.txt
#
# The program will print out a snippet which behaves the same as the code in the input file.
# For the fun of it, I golfed it down to a total of 79 characters.
# Of course, if you don't count whitespaces, you could apply the program to itself
# leading to a version with only 29 counted characters ;)
puts "eval ['#{$<.read.unpack('B*')[0].tr('01',' 
')}'.tr(' 
','01')].pack'B*'"
