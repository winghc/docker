docker run -d --name elastalert -it \
	--volume /opt/elastalert/config:/opt/config \
	--volume /opt/elastalert/logs:/opt/logs \
	--volume /opt/elastalert/rules:/opt/rules \
	citic/elastalert:0.0.95 
