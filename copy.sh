#!/usr/bin/expect -f

#How to Define a Function
proc copy_function { IP_ADDR } {
	spawn ssh-keygen -f "/home/mbhole/.ssh/known_hosts" -R $IP_ADDR
	interact ++ return
	spawn scp test_file admin@$IP_ADDR:/home/admin/
	expect "yes/no" {send "yes\r"} 
	interact ++ return
}

#How to invoke array
#copy_function 10.0.1.111


#How to define array
array set vm_list {
	vm1 10.0.1.111
	vm2 10.0.1.112
	vm3 10.0.1.113
	vm4 10.0.1.114
}

foreach vm [array name vm_list] {
	puts "Processing $vm--->$vm_list($vm)"
	copy_function $vm_list($vm)
}

#wait for all the child to finish
wait

