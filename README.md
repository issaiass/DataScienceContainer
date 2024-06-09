<details open>
<summary> <b>Data Science Container<b></summary>

Looking the log of docker

<p align="center">
<img src = "doc/jupyter-notebook.PNG?raw=true" center=true width="70%"/>
</p>


Looking the log of docker

<p align="center">
<img src = "doc/docker.PNG?raw=true" center=true width="70%"/>
</p>

Looking the log of docker-compose

<p align="center">
<img src = "doc/docker-compose.PNG?raw=true" center=true width="70%"/>
</p>

We allso added the same with docker-compose as an example.


</details>

<details open>
<summary> <b>Project Summary<b></summary>

Yo will use this container for developing applications based on default data science tools like scikit-learn, seaborn, matplotlib, etc. as specificed in the .devcontainer/Dockerfile or in .devcontainer/docker-compose.yml file

</details>

<details open>
<summary> <b>Files and Folders<b></summary>

- **.devcontainer**: docker compose and docker files.
  - *docker-compose.yml*: docker compose application starter
  - *Dockerfile*: the default docker container for creation
  - *setup_container.bash**: used in the Dockerfile
- **doc**: contains all the images located in this document.
- **src**: example files to test the container
  - *hello.py*: simple python example
  - *hello.ipynb*: simple ipynb example
- **.**: this folder contains the root path.
  - *.gitignore*: used for drop unused files and folders.
  - *cleanup.sh*: command to clean in docker.
  - *README.md*: this file

</details>


<details open>
<summary> <b>Build and Run the Repository Container with Docker<b></summary>

#### Instructions

- Download this repo
```sh
git clone https://github.com/issaiass/DockerDataScience.git
```
- Build the container
```sh
docker build -t data_science -f .devcontainer/Dockerfile .
```
- Run the container depending on the OS and shell
- On Linux
```sh
docker run -it --rm -p 8888:8888 -v "$(pwd):/app" data_science
```
- Windows (PowerShell)
```sh
docker run -it --rm -p 8888:8888 -v "${PWD}:/app" data_science
```
- On Windows (Command Prompt)
```sh
docker run -it --rm -p 8888:8888 -v "%cd%:/app" data_science
```
- Open a browser and navigate to:
```sh
localhost:8888
```
- This will load the jupyter notebook server on your brownser, enjoy! 🥳
- Whe you are done and your container is closed you can prune non used images or exited
```sh
./cleanup.sh
```
</details>

<details open>
<summary> <b>[Optional] - Building and Tag an Image to push<b></summary>

- You can also build with a tag
```sh
docker build -t issaiass/data_science:v1 -f .devcontainer/Dockerfile .
```
- or tag different images
```sh
docker build -t issaiass/data_science:latest -t issaiass/data_science:v1 -f .devcontainer/Dockerfile .
```
- or pull from docker hub
```sh
docker pull issaiass/data_science:v1
```
- With docker images remeber to prune the dangling images
```sh
docker rmi $(docker images -f "dangling=true" -q)
```
</details>


<details open>
<summary> <b>[Optional] - Building with Docker Compose<b></summary>

- Pull the container from docker hub
```sh
docker pull issaiass/data_science:v1
```

- Run the compose command
```sh
docker-compose -f .devcontainer/Dockerfile up
```

- Stop the container 
```sh
docker-compose -f .devcontainer/Dockerfile down
```
</details>




<details open>
<summary> <b>Video for Build, Tag, Push and Run Images<b></summary>

This will explaine how to run your container

[<img src= "https://img.youtube.com/vi/chiiGLlYRlY/0.jpg" />](https://youtu.be/chiiGLlYRlY)

</details>


<details open>
<summary> <b>Other Usefull Commands to Check of Tips<b></summary>

- For running a container
```sh
docker run -it --rm -p 8888:8888 -v "%cd%:/app" data_science /bin/bash -c "python app/src/hello_world.py"
docker run -it --rm -p 8888:8888 -v "%cd%:/app" data_science /bin/bash -c "jupyter notebook --ip=0.0.0.0 --port=8888 --allow-root --no-browser"
docker run ubuntu:latest /bin/bash
docker exec -it <name or id of running container> bash 

docker run --rm golang go version
docker run --name percy -it ubuntu:latest /bin/bash
docker stop <containerid>
docker rm <containerid>
docker exec -it e300adf2d22 bash
docker buildx build --platform linux/arm/v7 -t myimage:arm-v7
docker manifest inspect golang | grep 'architecture\|os'
docker inspect <container>
docker run -d --name <container_name> -p <host_port:container_port> <container:tag> # run container in the background
NOTE: Ctrl+PQ detachh your shell from the terminal and leave the container running (same as Ctrl+D)
```

- For prune in docker
```sh
docker container prune -f
docker network prune -f
docker volume prune -f
docker image prune -a -f
docker system prune -a -f
```

- Removing images
```sh
docker rm <name or id>             # remove an stoped contaier
docker rm $(docker ps -aq)         # remove all co
docker rm $(docker ps -aq) -f      # remove all forcing to not stop (caution to this!)
docker rmi $(docker images -q) -f
docker rmi <name or id>            # remove an image 
docker image prune #delete dangling images
```

- List and Check Images
```sh
docker ps -aq
docker images --filter-reference=*latest* 
docker image --filter dangling=true
docker images --filter=reference="*:latest*
docker images --format "{{.Repository}}: {{.Tag}}: {{.Size}}" # see image info
```

- For tagging and pushing a container
```sh
docker -t <username>/<app>:latest <username>/<app>:v1.0
docker push
```
- Export, zip and unzip a container
```sh
docker export <container_or_id> -o <file_name>.tar 
tar -czvf <file_name>.tar.gz <filename>.tar
tar -xvzf example1.tar.gz -C ./Documents
```

- Start, Stop, Build and Push in Docker Compose
```sh
docker-compose start
docker-compose stop 
docker-compose restart
docker-compose build
docker-compose push
```

- Execute and see logs in docker compose file
```sh
docker-compose exec <service_name> <command> 
docker-compose exec web bash
docker-compose run <service_name> <command>
docker-compose run web bash
docker-compose logs
docker-compose logs <service_name>
docker-compose rm
docker-compose config
```


- Search and Inspect
```sh
docker search opencv 
docker inspect ubuntu:latest
docker images --digests
docker images --digests apline
```




```sh
- Dockerfile
FROM alpine
LABEL maintainer="nigelpoulton@hotmail.com"
# Install Node and NPM
RUN apk add --update nodejs npm curl
# Copy app to /src
COPY . /src
WORKDIR /src
# Install dependencies
RUN  npm install
EXPOSE 8080
ENTRYPOINT ["node", "./app.js"]
- Building the dockerfile
docker build -t <image:tag> .doc
- Login
docker login
docker build -t <image:tag> .
docker tag <previmage:prevtag> <repo/currimage:currtag>
docker push <repo/image:tag>
# multiple builds
docker build -t multi:client --target prod-client -f Dockerfile-final .
docker build -t multi:server --target prod-server -f Dockerfile-final .
# build
docker buildx create --driver=docker-container --name=container
docker buildx build --builder=container --platform=linux/amd64,linux/arm64,linux/arm/v7 -t issaiass/ddd-book:ch8.1 --push .
docker compose up &
docker compose up --detach
docker compose -f <file.yml> up &
docker compose down
docker compose stop
docker compose top
docker volume inspect <name_of_volume> | grep Mount
docker cp <source> <image_name>:<volume_dst>
```

- Set a sudo password
```sh
sudo password ubuntu
```

- For a Docker Swarm
```sh
-- configure a docker swarm
multipass launch docker --name mgr1
mount failed: Mounts are disabled on this installation of Multipass.
$ multipass set local.privileged-mounts=true
-- on mgr1
docker swarm init --advertise-addr 172.19.127.232 --listen-addr 172.19.127.252
docker swarm join-token-manager
docker swarm join --token SWMTKN-1-2u4eu6wwapcw0mdiyaobrxcsbtpfcekt6ytk91mlsx5el0ex98-8puwt2nvudf1cftsth8hjssug 172.19.118.149:2377 --advertise-addr <ip>:2377 --listen-addr <ip>:2377
docker swarm join-token-worker
docker swarm join --token SWMTKN-1-2u4eu6wwapcw0mdiyaobrxcsbtpfcekt6ytk91mlsx5el0ex98-5qxthczmzhwfahfiajp5kc4p1 172.19.118.149:2377 --advertise-addr <ip>:2377 --listen-addr <ip>:2377
docker node ls
-- on worker 1
sudo apt install firewalld
sudo firewall-cmd --add-port=2377/tcp --permanent
sudo firewall-cmd --reload
for ssh change on /etc/ssh/sshd_config
PasswordAuthentication from no to yes
ChallengeResponseAuthentication from no to yes
docker swarm update --autolock=true
SWMKEY-1-ugy8lkREjF3okLGfcZH0p9TloGId4TBtOjiz4K1dTH4
docker node ls
docker swarm update # and enter the key
docker node update --availability drain mgr1
#from a manager
docker service create --name web-fe -p 8080:8080 --replicas 5 nigelpoulton/ddd-book:web0.1
docker service ps web-fe
docker service scale web-fe=7
docker network create -d overlay uber-net # create network
docker service create --name uber-svc --network uber-net -p 8080:8080 --replicas 12 nigelpoulton/ddd-book:web0.1
docker service update --image nigelpoulton/ddd-book:web0.2 --update-parallelism 2 --update-delay 20s uber-svc
```

- Docker Networking
```sh
docker network ls
ip link show docker0
docker inspect <name of network> | grep bridge.name
docker network create -d bridge localnet # create a localnet bridge driver
docker run -d --name c1 --network localnet alpine sleep 1d # create a new container
docker inspect localnet --format '{{json .Containers}}'
docker run -d --name web --network localnet --publish 5001:80 nginx # create a container named web with network localnet routing 5001 internally to 80
docker port web  
```

- Adding enviromental variables in docker-compose
```sh
    environment: # for setting environment variables
      - NGINX_HOST=${HOST}
      - NGINX_PORT=${PORT}
```

</details>



<details open>
<summary> <b>Contributing<b></summary>

Your contributions are always welcome! Please feel free to fork and modify the content but remember to finally do a pull request.

</details>

<details open>
<summary> :iphone: <b>Having Problems?<b></summary>

<p align = "center">

[<img src="https://img.shields.io/badge/linkedin-%230077B5.svg?&style=for-the-badge&logo=linkedin&logoColor=white" />](https://www.linkedin.com/in/riawa)
[<img src="https://img.shields.io/badge/telegram-2CA5E0?style=for-the-badge&logo=telegram&logoColor=white"/>](https://t.me/issaiass)
[<img src="https://img.shields.io/badge/instagram-%23E4405F.svg?&style=for-the-badge&logo=instagram&logoColor=white">](https://www.instagram.com/daqsyspty/)
[<img src="https://img.shields.io/badge/twitter-%231DA1F2.svg?&style=for-the-badge&logo=twitter&logoColor=white" />](https://twitter.com/daqsyspty) 
[<img src ="https://img.shields.io/badge/facebook-%233b5998.svg?&style=for-the-badge&logo=facebook&logoColor=white%22">](https://www.facebook.com/daqsyspty)
[<img src="https://img.shields.io/badge/linkedin-%230077B5.svg?&style=for-the-badge&logo=linkedin&logoColor=white" />](https://www.linkedin.com/in/riawe)
[<img src="https://img.shields.io/badge/tiktok-%23000000.svg?&style=for-the-badge&logo=tiktok&logoColor=white" />](https://www.linkedin.com/in/riawe)
[<img src="https://img.shields.io/badge/whatsapp-%23075e54.svg?&style=for-the-badge&logo=whatsapp&logoColor=white" />](https://wa.me/50766168542?text=Hello%20Rangel)
[<img src="https://img.shields.io/badge/hotmail-%23ffbb00.svg?&style=for-the-badge&logo=hotmail&logoColor=white" />](mailto:issaiass@hotmail.com)
[<img src="https://img.shields.io/badge/gmail-%23D14836.svg?&style=for-the-badge&logo=gmail&logoColor=white" />](mailto:riawalles@gmail.com)

</p>

</details>

<details open>
<summary> <b>License<b></summary>
<p align = "center">
<img src= "https://mirrors.creativecommons.org/presskit/buttons/88x31/svg/by-sa.svg" />
</p>
</details>