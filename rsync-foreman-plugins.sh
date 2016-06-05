rsync -avSHP --delete --exclude "f21" --exclude "*i386*" --exclude "source" rsync://yum.theforeman.org/yum/plugins/1.11 /opt/repos/foreman-plugins
