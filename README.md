# Build a basic web server and serve some persistent files from a Docker container
# Before you start you will need a server running Docker - https://www.docker.com/get-started - this can be a bare metal server, VM on your local PC or a cloud server on a service like Azure
# Once you have Docker up and running, you will need to provide Docker with a Dockerfile to tell it what to docker
# The file in this project downloads all pre-requisites to build an Ubuntu Server with Apache web server and PHP
# Review the Dockerfile to see further comments
# Once all the parts are in place, do the following
# Build a new Docker custom image, giving it a name tag (-t) (in this case 'purple') and set it to run in the current working directory by adding the trailing period .

docker build -t purple .

# Once the image is built, bring it up and port map the port 8080 (or whatever) on your host with the container port 80 - run it in the background (daemonized) with -d and reference your image

docker run -p 8080:80 -d purple

# Obviously containers don't persist data once turned off, so if you need persistant data, mount a local volume into a container for real-time changes to content
# This will map the local volume /Users/name/Documents/github/docker/www/site and map it to the /var/www/site volume inside the container, meaning when the container is stopped or started, the changed data remains on your local PC or server

docker run -p 8080:80 -d -v /Users/name/Documents/github/docker/www/site:/var/www/site purple
