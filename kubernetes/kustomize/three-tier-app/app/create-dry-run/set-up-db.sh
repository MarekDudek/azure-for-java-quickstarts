PGPASSWORD=postgres createuser --echo -U postgres -h postgres-on-k8s-dd db_user
PGPASSWORD=postgres psql              -U postgres -h postgres-on-k8s-dd -c "ALTER USER \"db_user\" WITH PASSWORD 'db_user'"
PGPASSWORD=postgres createdb   --echo -U postgres -h postgres-on-k8s-dd --owner=db_user my_db