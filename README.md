# Using this repo
To get started, ensure you are in a folder that is named after the app you want to create. 
If you are cloning this repo, use a command like this to ensure you are in the right place.
```
git clone https://github.com/hansonryne/rails-startup-scripts appname && cd appname
```

You need to have docker and docker-compose installed in order to get started.
Script for Debian looks like:
```
sudo apt-get update
sudo apt-get install \
    apt-transport-https \
    ca-certificates \
    curl \
    gnupg-agent \
    software-properties-common
curl -fsSL https://download.docker.com/linux/debian/gpg | sudo apt-key add -
sudo add-apt-repository \
   "deb [arch=amd64] https://download.docker.com/linux/debian \
   $(lsb_release -cs) \
   stable"
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io

sudo curl -L "https://github.com/docker/compose/releases/download/1.25.5/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose
```

Once you are in the right place, with docker installed, you can run the startup shell script to build the application filestructure.
```
docker run --rm -v ${PWD}:/${PWD##*/} -w /${PWD##*/} --network host ruby:alpine3.10 startup.sh
```
The startup.sh builds a new application using postgres for the database, stimulus_reflex as a JS frontend, and does it all under a user called "railsuser" in the container.

Once the app directory is built out, move the database.yml that came in this repo to config/database.yml to overwrite the defaults with the values from the environment variables file.
```
mv ./database.yml config/database.yml
```

Make sure that all the files are owned by the right user
```
chown -R 1000:1000 .
```

All that should be left is to docker-compose up and build
```
docker-compose up --build
```

## More notes
Instructions for installing tailwindcss as the CSS framework is in the notes directory. 
