

## Updae Debian on raspberry pi:
```
sudo apt-get update && sudo apt-get upgrade -y
```

## Generating pair of keys
ssh-keygen -t ed25519 -C "myname@hotmail.com"

## check key i have
ls -al ~/.ssh

## Adding your SSH key to the ssh-agent

eval "$(ssh-agent -s)"

ssh-add ~/.ssh/id_ed25519




## Update Homeassistant:
```
sudo su -s /bin/bash homeassistant
source /srv/homeassistant/bin/activate
pip3 install --upgrade homeassistant
```

