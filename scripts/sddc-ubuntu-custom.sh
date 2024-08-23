#!/bin/bash
log=/var/log/cust_output.log
if [[ "x${1}" = "xprecustomization" ]]; then
echo "Adding rackuser account..." >> ${log}
useradd -m -U -s /bin/bash rackuser
echo "rackuser ALL=(ALL) NOPASSWD:ALL" > /etc/sudoers.d/98-rackuser
mkdir -p /home/rackuser/.ssh >> ${log}
echo "ecdsa-sha2-nistp521 AAAAE2VjZHNhLXNoYTItbmlzdHA1MjEAAAAIbmlzdHA1MjEAAACFBAAb5NMKwEXyYxr+qsE+Zz/yoDo/R4zjs+qVmSnTb010FcFoy8WuZtLeM+t/cz7gc03/6qsVi8/ySlt16MJc+gyOsgHyQ9Ct+LginldAQ3uDKK8LkRcRcvrWtl9PueR98d4tMpcEoBB8j1AXAVBcSvhUEFHfxdmL6RaTpVb8Yzs+CgVYqg== rackadmin@raxdemo.com" > /home/rackuser/.ssh/authorized_keys
chown -R rackuser:rackuser /home/rackuser/.ssh >> ${log}
chmod 700 /home/rackuser/.ssh >> ${log}
chmod 600 /home/rackuser/.ssh/authorized_keys >> ${log}
password=$(openssl rand -base64 16)
echo "root:$password" | chpasswd
vmtoolsd --cmd "info-set guestinfo.custom.password $password"
passwd --expire root
elif [[ "x${1}" = "xpostcustomization" ]]; then
echo "customization complete..." >> ${log}
fi