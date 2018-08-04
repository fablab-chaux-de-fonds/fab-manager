#!/bin/bash
echo "drop database fablab_development;" | docker exec -i fabmanager-postgres /usr/bin/psql -U postgres
echo "create database fablab_development;" | docker exec -i fabmanager-postgres /usr/bin/psql -U postgres
zcat <path/of/file> | docker exec -i fabmanager-postgres /usr/bin/psql -U postgres -d fablab_development
