# Before using
## add your domain in /etc/hosts
mydomain.com  	x.x.x.x

## update ~/.bashrc with
```bash
###for fortiapi
echo 2 > $HOME/fmail/auth/auth.log
rm $HOME/fmail/auth/happy_cookie.txt 2> /dev/null
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


# use
```bash
./fmail
```
