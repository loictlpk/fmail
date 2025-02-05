# Before using
## add your domain in /etc/hosts
mydomain.com	    x.x.x.x

## update root crontab with
```bash
sudo crontab -e -u root
```
#### crontab content
```bash
@reboot bash $HOME/fmail.sh
```
#### connect as root
```bash
sudo su
nano $HOME/fmail.sh
```
#### script content
```bash
#!/bin/bash
###for fortiapi
sudo echo 2 > /bin/fortiapi/auth/auth.log
sudo rm /bin/fortiapi/auth/happy_cookie.txt 2> /dev/null
```
#### make executable
```bash
chmod +x $HOME/fmail.sh
```
## auth.log permissions must be
```bash
-rw-r--r-- 1 user group ..... auth/auth.log	 
```	
### if it's false do
```bash
chmod 644 auth/auth.log
```

## modify source/variables and adjust domain variable
```bash
domain="mydomain.com"
```
## move project directory to /bin
```bash
sudo mv -r fmail /bin/fortiapi
```

## create wrapper script
```bash
cd /bin
sudo touch fmail && sudo chmod +x fmail && sudo chown -R loic /bin/fortiapi && sudo nano fmail
```
### script content
```bash
#!/bin/bash
# Change repo
cd /bin/fortiapi
# exec script with all arguments
./fmail.sh "$@"
```


# use
```bash
fmail
```
