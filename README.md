# Docker apache2 and PHP

# Build a new Docker custom image, giving it a name, in this case purple and set it to run in the current working directory by the trailing .

docker build -t purple .

# Once the image is built, bring it up and port map the port 8080 (or whatever) on your host with the container port 80 - run it in the background with -d and reference your image

docker run -p 8080:80 -d purple

# Obviously containers don't persist data once turned off, so if you need persistant data, mount a local volume into a container for real-time changes to content

docker run -p 8080:80 -d -v /Users/name/Documents/github/docker/www/site:/var/www/site purple
