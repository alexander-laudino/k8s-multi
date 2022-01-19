docker build -t alexanderlaudino/multi-client:latest -t alexanderlaudino/multi-client:$SHA -f ./client/Dockerfile ./client
docker build -t alexanderlaudino/multi-worker:latest -t alexanderlaudino/multi-worker:$SHA -f ./worker/Dockerfile ./worker
docker built -t alexanderlaudino/multi-server:latest -t alexanderlaudino/multi-server:$SHA -f ./server/Dockerfile ./server

docker push alexanderlaudino/multi-client:latest
docker push alexanderlaudino/multi-worker:latest
docker push alexanderlaudino/multi-server:latest

docker push alexanderlaudino/multi-client:$SHA
docker push alexanderlaudino/multi-worker:$SHA
docker push alexanderlaudino/multi-server:$SHA

kubectl apply -f k8s
kubectl set image deployments/client-deployment client=alexanderlaudino/multi-client:$SHA
kubectl set image deployments/worker-deployment worker=alexanderlaudino/multi-worker:$SHA
kubectl set image deployments/server-deployment server=alexanderlaudino/multi-server:$SHA