#!/usr/bin/expect

#connect
spawn telnet 172.22.44.239

#wait login
expect "login:"

#send login
send "root\n"

#wait pass
expect "Password:"

#send pass
send "q1w2e3\n"

#wait inv
#expect "[root@kiev-retail-bras-1 root]#\r"

send "lsh\n"

#expect "root@kiev-retail-bras-1>"
#command
send "show subscriber summary\n"

#send " "
#send " "
#send " "
#send " "

#exit
send "exit\n"
send "exit\n"

#this is the end
expect eof
