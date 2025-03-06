filename=$1

if [ $# -eq 0 ] 
then
  echo "Enter the filename, please!"
else
  if [ -d $1 ] 
  then
    echo "This is a directory!"
  else
    echo "This is a common file!"
  fi

fi

