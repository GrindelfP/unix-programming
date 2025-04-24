src=file3

#1
awk -F, '{sum += $2} END {print "Total, " sum}' $src && echo '\n'

#2
awk -F, '$1 == "Apple" {sum += $2} END {print "Total Apple, " sum}' $src && echo '\n'

#3 
awk -F, '!seen[$1]++ {fruits[$1] = $1} END {for (fruit in fruits) print fruit}' $src && echo '\n'

#4
awk -F, '{sum[$1] += $2} END {for (fruit in sum) print fruit ", " sum[fruit]}' $src && echo '\n'

# 5

for fruit in $(awk -F',' '{print $1}' $src | sort | uniq); do
    awk -F',' -v fruit="$fruit" '$1 == fruit {print $0}' $src > "fruits/$fruit"
done

# 6
awk -F',' '$2 < 300 {print $0 > "Less300"} $2 >= 300 {print $0 > "More300"}' $src && echo '\n'
