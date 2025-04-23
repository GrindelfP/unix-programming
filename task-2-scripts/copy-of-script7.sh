if [[ $# -ge 2 ]]; then
  
  path=$1
  newpath=copy-of-$path
  n=$2

  if [[ -f $path ]]; then
    touch $newpath
    for ((i = 0; i < n; i++)); do
      cat $path >> $newpath
    done


    oldLines=$(wc -l < "$path")
    newLines=$(wc -l < "$newpath") 
    oldWords=$(wc -w < "$path")
    oldChars=$(wc -c < "$path")
    newWords=$(wc -w < "$newpath")
    newChars=$(wc -c < "$newpath")

    echo $path ":: words =" $oldWords "chars =" $oldChars "lines =" $oldLines
    echo $newpath ":: words =" $newWords "chars =" $newChars "lines =" $newLines
  else
    echo "\033[0;31mDirectory, not file!\033[0m"
  fi

else
  echo "\033[0;31mIllegal params number. Enter filename and multiplication factor!\033[0m"
fi

if [[ $# -ge 2 ]]; then
  
  path=$1
  newpath=copy-of-$path
  n=$2

  if [[ -f $path ]]; then
    touch $newpath
    for ((i = 0; i < n; i++)); do
      cat $path >> $newpath
    done


    oldLines=$(wc -l < "$path")
    newLines=$(wc -l < "$newpath") 
    oldWords=$(wc -w < "$path")
    oldChars=$(wc -c < "$path")
    newWords=$(wc -w < "$newpath")
    newChars=$(wc -c < "$newpath")

    echo $path ":: words =" $oldWords "chars =" $oldChars "lines =" $oldLines
    echo $newpath ":: words =" $newWords "chars =" $newChars "lines =" $newLines
  else
    echo "\033[0;31mDirectory, not file!\033[0m"
  fi

else
  echo "\033[0;31mIllegal params number. Enter filename and multiplication factor!\033[0m"
fi

if [[ $# -ge 2 ]]; then
  
  path=$1
  newpath=copy-of-$path
  n=$2

  if [[ -f $path ]]; then
    touch $newpath
    for ((i = 0; i < n; i++)); do
      cat $path >> $newpath
    done


    oldLines=$(wc -l < "$path")
    newLines=$(wc -l < "$newpath") 
    oldWords=$(wc -w < "$path")
    oldChars=$(wc -c < "$path")
    newWords=$(wc -w < "$newpath")
    newChars=$(wc -c < "$newpath")

    echo $path ":: words =" $oldWords "chars =" $oldChars "lines =" $oldLines
    echo $newpath ":: words =" $newWords "chars =" $newChars "lines =" $newLines
  else
    echo "\033[0;31mDirectory, not file!\033[0m"
  fi

else
  echo "\033[0;31mIllegal params number. Enter filename and multiplication factor!\033[0m"
fi

if [[ $# -ge 2 ]]; then
  
  path=$1
  newpath=copy-of-$path
  n=$2

  if [[ -f $path ]]; then
    touch $newpath
    for ((i = 0; i < n; i++)); do
      cat $path >> $newpath
    done


    oldLines=$(wc -l < "$path")
    newLines=$(wc -l < "$newpath") 
    oldWords=$(wc -w < "$path")
    oldChars=$(wc -c < "$path")
    newWords=$(wc -w < "$newpath")
    newChars=$(wc -c < "$newpath")

    echo $path ":: words =" $oldWords "chars =" $oldChars "lines =" $oldLines
    echo $newpath ":: words =" $newWords "chars =" $newChars "lines =" $newLines
  else
    echo "\033[0;31mDirectory, not file!\033[0m"
  fi

else
  echo "\033[0;31mIllegal params number. Enter filename and multiplication factor!\033[0m"
fi

if [[ $# -ge 2 ]]; then
  
  path=$1
  newpath=copy-of-$path
  n=$2

  if [[ -f $path ]]; then
    touch $newpath
    for ((i = 0; i < n; i++)); do
      cat $path >> $newpath
    done


    oldLines=$(wc -l < "$path")
    newLines=$(wc -l < "$newpath") 
    oldWords=$(wc -w < "$path")
    oldChars=$(wc -c < "$path")
    newWords=$(wc -w < "$newpath")
    newChars=$(wc -c < "$newpath")

    echo $path ":: words =" $oldWords "chars =" $oldChars "lines =" $oldLines
    echo $newpath ":: words =" $newWords "chars =" $newChars "lines =" $newLines
  else
    echo "\033[0;31mDirectory, not file!\033[0m"
  fi

else
  echo "\033[0;31mIllegal params number. Enter filename and multiplication factor!\033[0m"
fi

