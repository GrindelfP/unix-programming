src=file1

#1. NAMES
awk ' {print $1} ' $src && echo '\n'

#2. COMPANIES
awk ' {print $2} ' $src && echo '\n'

#3. ANY COLUMN WITHOUT HEADER
awk 'NR > 1 {print $2} ' $src && echo '\n'

#4. COLUMNS WITH SEP ','
awk ' {print $1 ", " $2}' $src && echo '\n'
