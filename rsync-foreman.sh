#rsync -avSHP --delete --include "el7"  --exclude "*i386*" --exclude "source" rsync://yum.theforeman.org/yum/releases/1.11 /opt/repos/foreman/1.11
wget -X i386,SRPMS -r -np -k -A rpm http://yum.theforeman.org/releases/1.11/el7/x86_64/
