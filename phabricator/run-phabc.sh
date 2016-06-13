docker rm -f phabc
docker run -d \
    --name phabc \
    -p 8044:80 -p 443:443 -p 22:22 \
    --env PHABRICATOR_HOST=192.168.3.13:8044 \
    --env MYSQL_HOST=192.168.3.13 \
    --env MYSQL_USER=codereview \
    --env MYSQL_PASS=password \
    --env PHABRICATOR_REPOSITORY_PATH=/repos \
    -v /srv/phabc/repo:/repos \
    hachque/phabricator
