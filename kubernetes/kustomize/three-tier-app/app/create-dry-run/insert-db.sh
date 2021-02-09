PGPASSWORD=db_user  psql -U db_user -h "${DB_SERVICE_URL}" -p "${DB_SERVICE_PORT}" -d my_db -c "
  INSERT INTO some_table (description) VALUES ('some description')
"