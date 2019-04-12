version="7.7"
full_version="${version}.0"

docker build --squash -t fiware/ckan-extended:2.8-${full_version} .
docker build --squash -t fiware/ckan-extended:2.7-${full_version} . -f Dockerfile-2.7

docker tag fiware/ckan-extended:2.8-${full_version} fiware/ckan-extended:2.8-${version}
docker tag fiware/ckan-extended:2.7-${full_version} fiware/ckan-extended:2.7-${version}
docker tag fiware/ckan-extended:2.8-${full_version} fiware/ckan-extended:${full_version}
docker tag fiware/ckan-extended:2.8-${full_version} fiware/ckan-extended:${version}
docker tag fiware/ckan-extended:2.8-${version} fiware/ckan-extended:latest


docker push fiware/ckan-extended:2.8-${full_version}
docker push fiware/ckan-extended:2.7-${full_version}
docker push fiware/ckan-extended:2.8-${version}
docker push fiware/ckan-extended:2.7-${version}
docker push fiware/ckan-extended:${full_version}
docker push fiware/ckan-extended:${version}
docker push fiware/ckan-extended:latest
