docker build -t alexanderlaudino/multi-client -f ./client/Dockerfile ./client
docker build -t alexanderlaudino/multi-worker -f ./worker/Dockerfile ./worker
docker built -t alexanderlaudino/multi-server -f ./server/Dockerfile ./server
docker push alexanderlaudino/multi-client
docker push alexanderlaudino/multi-worker
docker push alexanderlaudino/multi-server