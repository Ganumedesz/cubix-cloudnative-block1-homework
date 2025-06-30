#!/bin/sh

docker run -d --name test -p 8080:8080 ghcr.io/ganumedesz/cubix/1/homework/app:springboot > /dev/null
sleep 10
curl --fail http://localhost:8080/cubix/test
RESULT=$?
if [ $RESULT -ne 0 ]; then
  echo "Verification failed, here are the logs"
  docker logs test
fi
docker stop test > /dev/null
docker rm test > /dev/null
exit $RESULT
