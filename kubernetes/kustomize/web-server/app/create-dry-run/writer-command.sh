IFS=$'\n\t'
set -euxo pipefail

mkdir /mnt/files

COUNTER=0

while true;
do
  touch /mnt/files/file-$COUNTER.txt
  sleep 1
  (( COUNTER++ )) || true
done