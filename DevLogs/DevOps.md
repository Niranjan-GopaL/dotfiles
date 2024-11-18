## Important Pages in Doc
- https://docs.docker.com/reference/ <-- all CLI references
- Docker containers ALWAYS expose some PORTS through which outside world interacts with it


## What I want is --> DOCKER COMPOSE




## Both the containers have to be in the same NETWROK
```sh
docker network create
docker network ls

docker run \
-p 27017:27017 \
-e MONGO_INITDB_ROOT_USERNAME: root \
-e MONGO_INITDB_ROOT_PASSWORD: example \
--name mongo_db \
--net monogo_network \
-d \
THIS_IS_MONGO_DB
```

docker run -p 27017:27017 -e MONGO_INITDB_ROOT_USERNAME=root -e MONGO_INITDB_ROOT_PASSWORD=example --name mongo --net monogo_network -d THIS_IS_MONGO_DB

## Using BOTH  the latest and LTS version of an image 
```sh
# -d := DETACH THE TERMINAL ; as in the comamnd will execute in the background 
docker run --name default_is_latest -e POSTGRES_PASSWORD=mysecretpassword -d postgres 
# same as the below
docker run --name latest_is_latest -e POSTGRES_PASSWORD=mysecretpassword -d postgres:latest 

# Manual PORT MAPPING
docker run --name [name] -p 4000:5432 -d [image] \
&& docker ps 
```


## BASIC
```sh
docker pull postggres
docker image ls
dokcer ps # list all containers

docker run postgres         # runs the latest version of the image by default
docker run python:3.11.1    # version specificatiion   
docker run [image_name]:[tag]    # version specificatiion   

# `THE DOCUMENTATION WILL HAVE HOW TO RUN INSTRUCTION`
docker run --name my-postgres -e POSTGRES_PASSWORD=password -d postgres
docker run --name this_is_a_new_container -e POSTGRES_PASSWORD=password -d postgres



# to stop docker from running a container
docker stop  my-postgres
docker stop  this_is_a_new_container
docker stop [first_few_numbers_of_the_container_id] # this will stop the container too ; 

# to remove the IMAGE [ think here]
docker image rm

# simple stuff
docker container ls -a # shows all the containers 
docker containers ls  # shows all the running containers
docker container rm

```

