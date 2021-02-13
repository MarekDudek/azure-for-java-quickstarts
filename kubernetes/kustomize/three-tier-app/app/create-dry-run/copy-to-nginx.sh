IFS=$'\n\t'
set -euxo pipefail

PGPASSWORD="$CLIENT_PASSWORD" psql \
  --user="$CLIENT_USER" \
  --host="$DB_SERVICE_URL" \
  --port="$DB_SERVICE_PORT" \
  --dbname=my_db \
  --output=index.html \
  --html \
  --command="
    SELECT * FROM some_table
  "

cp index.html /usr/share/nginx/html