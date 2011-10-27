# Creating a hash by definition
# old style
colours = {"Red" => 0xFF0000, "Blue" => 0x00FF00, "Green" => 0x0000FF}

# new style
colours = {Red: 0xFF0000, Blue: 0x00FF00, Green: 0x0000FF}

# old format no longer supported in 1.9
# colours = {Red:, 0xFF0000, Blue:, 0x00FF00, Green:, 0x0000FF}

# in 1.9 insertion order is respected unlink in 1.8.7 you were not guaranteed of order based on insertion

# index of
colours = {Red: 0xFF0000, Blue: 0x00FF00, Green: 0x0000FF}
colours.index(0xFF0000) # depreciated in 1.9
colours.key(0xFF0000) # use this instead

# select now returns a hash rather than an array of arrays
colours = {Red: 0xFF0000, Blue: 0x00FF00, Green: 0x0000FF}
colours.select { |k, v| k.to_s.downcase =~ /r/}
colours.select! { |k, v| k.to_s.downcase =~ /r/}; colours
colours.keep_if { |k, v| k.to_s.downcase =~ /r/}; colours

# flattening a hash
colours = {Red: 0xFF0000, Blue: 0x00FF00, Green: 0x0000FF}
colours.flatten

# array with pairs to hash
colours = [[:Red, 0xFF0000], [:Blue, 0x00FF00], [:Green, 0x0000FF]]
