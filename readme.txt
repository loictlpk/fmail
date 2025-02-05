-- add your domain in /etc/hosts --
	mydomain	x.x.x.x

-- update ~/.bashrc with --
	#for fortiapi
	echo 2 > $HOME/fortiapi/auth/auth.log
	rm $HOME/fortiapi/auth/happy_cookie.txt 2> /dev/null

-- auth.log permissions must be --
	-rw-r--r-- 1 user group ..... auth/auth.log	 
	
	-- if false --
		chmod 644 auth/auth.log

-- Create info.txt with your domain info --
	
	[GLOBAL]

	# DO NOT FORGET TO MODIFY /etc/hosts
	domain=your.domain.you

-- use --
./fmail
