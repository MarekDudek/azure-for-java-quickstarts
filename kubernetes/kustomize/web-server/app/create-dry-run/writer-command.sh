IFS=$'\n\t'
set -euxo pipefail

COUNTER=0

while true;
do
  touch /mnt/files-out/file-$COUNTER.txt
  sleep .1
  (( COUNTER++ )) || true
done