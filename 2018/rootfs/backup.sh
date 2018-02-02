now=`date +%Y-%m-%d`
echo '当前日期:' $(now)

cd /opt/bitnami/phabricator/bin
./storage dump | gzip > ~/$(now).sql.gz

cd /bitnami/phabricator/data
tar -zcvf ~/$(now)-data.tar.gz .

cd /bitnami/phabricator/repo
tar -zcvf ~/$(now)-repos.tar.gz .
