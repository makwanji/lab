# openwebui



## Install docker


sudo apt install docker.io
sudo usermod -aG docker ${USER}
sudo apt install docker-compose-plugin
sudo apt install docker-compose-plugin


## docker compose
```bash
sudo apt update
sudo apt install ca-certificates curl gnupg lsb-release

sudo mkdir -p /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg

echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt update



sudo apt install docker-compose-plugin


docker compose version
```


## Create network

docker network create frontend

## Copy compose file