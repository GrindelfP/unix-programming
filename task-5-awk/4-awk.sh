awk -F';' 'BEGIN {OFS=";"} 
{
  if (NR == 1) {
    print $1, $2;
    next;
  }

  gsub(/[^0-9]/, "", $2);
  if (length($2) == 10) {
    $2 = "+7(" substr($2, 1, 3) ")" substr($2, 4, 3) "-" substr($2, 7, 2) "-" substr($2, 9, 2);
  } else if (length($2) == 11 && substr($2, 1, 1) == "8") {
    $2 = "+7(" substr($2, 2, 3) ")" substr($2, 5, 3) "-" substr($2, 8, 2) "-" substr($2, 10, 2);
  } else if (length($2) == 11 && substr($2, 1, 1) == "7") {
    $2 = "+7(" substr($2, 2, 3) ")" substr($2, 5, 3) "-" substr($2, 8, 2) "-" substr($2, 10, 2);
  }
  print $1, $2;
}' file4 >> file4_formatted
