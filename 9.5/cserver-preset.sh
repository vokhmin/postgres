#!/bin/bash
set -e

# cServer specific config
sed -i 's/\(host\s*all\s*all\s*127.0.0.1\/32\s*\)trust/\1md5/' /var/lib/postgresql/data/pg_hba.conf
{ echo; echo "127.0.0.1 	pdb-demo.reference.cs.spotwa.re"; } >> "/etc/hosts"

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE DATABASE ctrader_spotware
    ;
EOSQL

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" --dbname=ctrader_spotware <<-EOSQL
	CREATE EXTENSION dblink
	;
	CREATE USER $REF_DEMO_USER WITH PASSWORD '$REF_DEMO_PASSWORD'
	;
	CREATE TABLE lmax_symbols (
	  alias text,
	  data text
	);
	GRANT ALL ON lmax_symbols TO reference_demo
	;
EOSQL
