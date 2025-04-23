sum=0
prod=0
pi=31415 # pi * 10^4

for ((i = 0; i < 10; i++)); do
  prod=`expr $i \* $pi`
  sum=`expr $sum + $prod`
done

echo "Result:\" $sum\ "\e-4"

