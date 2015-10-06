#!/bin/bash
# David Backeberg
# 20151006
# rebuild vmwark kernel modules if there are not any for this kernel

# chkconfig: - 09 09
# description: rebuild_vm_modules
# processname: rebuild_vm_modules
# pidfile: /var/run/rebuild_vm_modules.pid

# Source function library.
if [ -e /etc/rc.d/init.d/functions ]; then
   . /etc/rc.d/init.d/functions
fi

declare mod_count=$(ls -1 /lib/modules/`uname -r`/misc/v*ko 2>/dev/null| wc -l)
#echo "Modules count is: ${mod_count}"

if [ ${mod_count} -ne 0 ] ; then
    echo "VMWare modules already built for kernel `uname -r`"
else
    echo "Building VMWare modules for kernel `uname -r`"
    sudo /usr/bin/vmware-config-tools.pl -d
    echo "VMWare Drivers built"
fi
