docker build -t fiware/ckan-extended:2.8 .
docker build -t fiware/ckan-extended:2.7 . -f Dockerfile-2.7

docker tag fiware/ckan-extended:2.8 fiware/ckan-extended:latest
