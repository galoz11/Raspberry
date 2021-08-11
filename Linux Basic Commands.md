

## Updae Debian on raspberry pi:
```
sudo apt-get update && sudo apt-get upgrade -y
```
## Update Homeassistant:
```
sudo su -s /bin/bash homeassistant
source /srv/homeassistant/bin/activate
pip3 install --upgrade homeassistant
```

