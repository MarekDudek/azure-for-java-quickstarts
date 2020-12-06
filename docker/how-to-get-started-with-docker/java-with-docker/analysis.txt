
# Building
docker build . --tag spring-app-on-docker:my-tag

# Running locally
docker run --detach --publish 9090:8080 spring-app-on-docker:my-tag

# Sharing on Docker Hub

Name image like <Your Docker ID>/<Repository Name>:<tag>
marekdudek/mdrepo:1.0

docker tag spring-app-on-docker:my-tag marekdudek/mdrepo:1.0
docker push marekdudek/mdrepo:1.0


In Azure name/tag is 
	marekdudek/mdrepo:1.0

On App Services 8080 is automatically exposed as 80.
On Azure Container Instances 8080 needs to be exposed explicitely.
