PGPASSWORD=postgres dropdb   --echo -U postgres -h postgres-on-k8s-dd my_db
PGPASSWORD=postgres dropuser --echo -U postgres -h postgres-on-k8s-dd db_user