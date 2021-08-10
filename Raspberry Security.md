# Raspberry Security
#### To add a new user, enter:
```sudo adduser dan```

#### To add them to the sudo group to give them sudo permissions:
```sudo adduser galoz sudo```


#### logout and login with new user, check if you are sudo with this command:
```sudo su```

#### delete pi homefolder and user
```sudo deluser -remove-home pi```

#### delete user pi:
```
sudo deluser pi
sudo rm -r /home/pi
```


#### Make sudo require a password
```sudo nano /etc/sudoers.d/010_pi-nopasswd```

dan ALL=(ALL) PASSWD: ALL

#### Using key-based authentication.
```
ssh-keygen
cat id_rsa.pub >> ~/.ssh/authorized_keys
sudo chmod 644 ~/.ssh/authorized_keys
```

```sudo nano /etc/ssh/sshd_config```
##### change those entry to "no"
* ChallengeResponseAuthentication no 
* PasswordAuthentication no 
* UsePAM no 

```sudo service ssh reload```
