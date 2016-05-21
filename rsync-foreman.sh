rsync -avSHP --delete --exclude "*i386*" --exclude "source" rsync://yum.theforeman.org/yum/releases/1.11/el7 /opt/yum/foreman >> /var/log/rsync/rsync_`date +\%Y\%m\%d`.log 2>&1
