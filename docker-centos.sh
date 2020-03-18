*******
#get docker from https://download.docker.com/linux/static/stable/
#wget https://download.docker.com/linux/static/stable/x86_64/docker-19.03.1.tgz  
#chmod 777 ~/dockerinstall/docker-19.03.1.tgz 
#tar xvzf ~/dockerinstall/docker-19.03.1.tgz 

*********

sudo cp ~/dockerinstall/docker/* /usr/bin/ 
echo "sudo dockerd" >>~/dockerinstall/docker-daemon.sh 
chmod a+x ~/dockerinstall/docker-daemon.sh 
sudo cp ~/dockerinstall/docker-daemon.sh /usr/bin 
sudo chmod a+x /usr/bin/docker-daemon.sh 

#create a file at  /lib/systemd/system/docker.service
*************************************
#Use vi to add these entry into the service
echo "
[Unit]
Description=Docker Daemon Service

[Service]
Type=simple
ExecStart=/bin/bash /usr/bin/docker-daemon.sh

[Install]
WantedBy=multi-user.target
" >>~/dockerinstall/docker.service

*************************************
sudo cp ~/dockerinstall/docker.service /lib/systemd/system/docker.service
sudo cp /lib/systemd/system/docker.service /etc/systemd/system/docker.service
sudo chmod 644 /etc/systemd/system/docker.service
sudo groupadd docker
sudo usermod -aG docker ${USER}

#Enable Docker service to start at boot
sudo systemctl enable docker

# Check status of docker
sudo systemctl status docker

