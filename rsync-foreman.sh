rsync -avSHP --delete --include "el6" --include "el7"  --exclude "*i386*" --exclude "source" rsync://yum.theforeman.org/yum/releases/1.10 /opt/repos/foreman/1.10
