flag=$1
path=$2

if [[ $# -ge 2 ]]; then
  
  if [[ ! -d $path ]]; then
    echo "\033[0;31mERROR! Provided path is not a directory!\033[0m"
  else

    if [[ $flag == "-f" ]]; then
      ls -p "$path" | grep -v /
    elif [[ $flag == "-d" ]]; then
      ls -p "$path" | grep / 
    fi

  fi

else
  echo "\033[0;31mERROR! Illegal number of arguments provided!\033[0m"
fi

