# Before using
## add your domain in /etc/hosts
mydomain.com	    x.x.x.x

## update ~/.bashrc with
```bash
###for fortiapi
echo 2 > $HOME/fortiapi/auth/auth.log
rm $HOME/fortiapi/auth/happy_cookie.txt 2> /dev/null
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
sudo touch fmail && sudo chmod +x fmail && sudo nano fmail
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
