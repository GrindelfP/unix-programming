echo "Script name is -" $0

echo "Process ID is -" $$

echo "Number of params is -" $#

echo "Params as single line:" $*

for param in $@
do
	echo "$param"
done

# echo "Params as discrete lines:" $@

