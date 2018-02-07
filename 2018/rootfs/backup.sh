
# 参数1: 示例stringstechOA@10.0.1.120:~/docker/bitnami/backup

cd /opt/bitnami/phabricator/bin
./storage dump | gzip > ~/backup-sql.gz

cd /bitnami/phabricator/data
tar -zcvf ~/backup-data.tar.gz .

cd /bitnami/phabricator/repo
tar -zcvf ~/backup-repos.tar.gz .

cd ~
scp backup-* $1
