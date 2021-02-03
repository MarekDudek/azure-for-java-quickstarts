IFS=$'\n\t'
set -euxo pipefail

while true;
do
  date
  wget --quiet --spider "$WEB_SERVER":"$PORT" || exit
  sleep 1
done