src=file2

# *3
awk '{ $1 = $1*3; print $1 }' $src && echo '\n'

# before and after *3
awk '{ $2= $1*3; print $1 " * 3 = " $2 }' $src && echo '\n'

# sum
awk '{ sum += $1 } END { print sum }' $src && echo '\n'
