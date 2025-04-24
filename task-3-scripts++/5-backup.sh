if [ $# -ne 2 ]; then
  echo "Provide following params structure: sh 5-backup.sh $0 <directory to backup> <backup directory>"
  exit 1
fi

src=$1
backup=$2

DATE=$(date +"%Y.%m.%d_%H.%M")

archname=$(basename "$src")_$DATE.tar.gz

archive="$backup/$archname"

tar -czf "$archive" -C "$(dirname "$src")" "$(basename "$src")"

if [ $? -eq 0 ]; then
  echo "The backup successfully created at path $archive"
else
  echo "Error while creating the backup"
  exit 1
fi
