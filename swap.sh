#--CREATE SWAP PARTITION--#
dd if=/dev/zero of=/swapfile bs=1024 count=1024k #read from /dev/zero write to /swapfile r/w up to 1024 bytes copy only 1024k blocks
chown root:root /swapfile #change file owner /swapfile to root user in root group
chmod 0600 /swapfile #add permission 600
mkswap /swapfile #setup a linux swap area i.e on /swapfile
swapon /swapfile #enable devices and files for paging and swapping
echo "/swapfile          swap            swap    defaults        0 0" >> /etc/fstab #make swapfile visible in /etc/fstab
sysctl vm.swappiness=10 #tell the kernel to use swap when the memory usage is up to 90%
echo vm.swappiness=10 >> /etc/sysctl.conf #write it at the end of /etc/sysctl.conf
free -h
cat /proc/sys/vm/swappiness