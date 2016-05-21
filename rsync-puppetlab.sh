rsync -avSHP --delete --include "*/1.1[0,1]/el[6,7]" --exclude "*i386*" --exclude "SRPMS" rsync://yum.puppetlabs.com/yum/el/[6,7] /opt/yum/puppetlabs
