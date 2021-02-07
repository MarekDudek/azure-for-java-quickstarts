IFS=$'\n\t'
set -euxo pipefail

while true;
do
  for FILE in /mnt/files-in/file-*.txt ; do
    rm -f "$FILE"
  done
  sleep 1
done