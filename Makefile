program_name = invoke-userlevel-app-2 

obj-m += hello.o		# make oops ...
obj-m += oops.o			# make oops ...
obj-m += invoke-userlevel-app-2.o


all:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) modules

# insert
i:
	insmod invoke-userlevel-app-2.ko 		# Try 'modprobe' in near future

# remove
r:
	rmmod $(program_name)

# print
p:
	dmesg

# clear dmesg
c:
	dmesg -c

info:
	modinfo $(program_name).ko 			#userspace program prints .modinfo section

clean:
	make -C /lib/modules/$(shell uname -r)/build M=$(PWD) clean
