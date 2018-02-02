
cd /opt/bitnami/phabricator/bin
./storage dump | gzip > ~/backup-sql.gz

cd /bitnami/phabricator/data
tar -zcvf ~/backup-data.tar.gz .

cd /bitnami/phabricator/repo
tar -zcvf ~/backup-repos.tar.gz .
