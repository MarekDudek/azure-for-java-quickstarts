IFS=$'\n\t'
set -euxo pipefail

for _ in {1..60}
do
  PGPASSWORD="$CLIENT_PASSWORD" psql \
    --user="$CLIENT_USER" \
    --host="$DB_SERVICE_URL" \
    --port="$DB_SERVICE_PORT" \
    --dbname=my_db \
    --command="
      INSERT INTO some_table (description) VALUES (md5(random()::text))
    "

  sleep 1
done