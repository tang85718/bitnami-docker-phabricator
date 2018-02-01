apachectl stop
cd /opt/bitnami/phabricator/bin
./phd stop --force

cd /opt/bitnami/phabricator
git checkout stable
git pull

cd /opt/bitnami/libphutil
git checkout stable
git pull

cd /opt/bitnami/arcanist
git checkout stable
git pull

cd /opt/bitnami/phabricator/bin
./storage upgrade
./phd start --force
apachectl start