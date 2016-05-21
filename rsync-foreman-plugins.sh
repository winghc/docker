rsync -avSHP --delete --include "*/1.1[0,1]/el[6,7]" --exclude "*i386*" --exclude "source" rsync://yum.theforeman.org/yum/plugins/ /opt/yum/foreman-plugins
