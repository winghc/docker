FROM citic/elastalert-base:0.0.95
MAINTAINER "H.Chen" <winghc@hotmail.com>

# clone from https://github.com/krizsan/elastalert-docker

# Directory holding configuration for Elastalert and Supervisor.
ENV CONFIG_DIR /opt/config
# Elastalert rules directory.
ENV RULES_DIRECTORY /opt/rules
# Elastalert configuration file path in configuration directory.
ENV ELASTALERT_CONFIG ${CONFIG_DIR}/elastalert_config.yaml
# Directory to which Elastalert and Supervisor logs are written.
ENV LOG_DIR /opt/logs
# Elastalert home directory name.
ENV ELASTALERT_DIRECTORY_NAME elastalert
# Elastalert home directory full path.
ENV ELASTALERT_HOME /opt/${ELASTALERT_DIRECTORY_NAME}
# Supervisor configuration file for Elastalert.
ENV ELASTALERT_SUPERVISOR_CONF ${CONFIG_DIR}/elastalert_supervisord.conf
# Alias, DNS or IP of Elasticsearch host to be queried by Elastalert. Set in default Elasticsearch configuration file.
ENV ELASTICSEARCH_HOST elasticsearch_host
# Port on above Elasticsearch host. Set in default Elasticsearch configuration file.
ENV ELASTICSEARCH_PORT 9200

# Copy the script used to launch the Elastalert when a container is started.
COPY ./start-elastalert.sh /opt/
COPY ./*.tar.gz  /opt/ 

WORKDIR /opt/

RUN tar -xvzf configparser-3.3.0r2.tar.gz && \
	cd configparser-3.3.0r2 && \
	python setup.py install 

WORKDIR /opt
# Download and unpack Elastalert.
##RUN wget ${ELASTALERT_URL} && \
RUN  tar -xvzf v0.0.95.tar.gz && \
	mv e* ${ELASTALERT_DIRECTORY_NAME}

WORKDIR ${ELASTALERT_HOME}


RUN pip install elasticsearch argparse tlslite oauthlib
RUN python setup.py install 
RUN pip install -r requirements.txt 

	# Install Supervisor.
RUN	easy_install supervisor && \

	# Make the start-script executable.
	chmod +x /opt/start-elastalert.sh && \
	
	# Create directories. The /var/empty directory is used by openntpd.
	mkdir -p ${CONFIG_DIR} && \
	mkdir -p ${RULES_DIRECTORY} && \
	mkdir -p ${LOG_DIR} && \
	mkdir -p /var/empty && \

	# Copy default configuration files to configuration directory.
	cp ${ELASTALERT_HOME}/config.yaml.example ${ELASTALERT_CONFIG} && \
	cp ${ELASTALERT_HOME}/supervisord.conf.example ${ELASTALERT_SUPERVISOR_CONF} && \

	# Elastalert configuration:
	# Set the rule directory in the Elastalert config file to external rules directory.
	sed -i -e"s|rules_folder: [[:print:]]*|rules_folder: ${RULES_DIRECTORY}|g" ${ELASTALERT_CONFIG} && \
	# Set the Elasticsearch host that Elastalert is to query.
	sed -i -e"s|es_host: [[:print:]]*|es_host: ${ELASTICSEARCH_HOST}|g" ${ELASTALERT_CONFIG} && \
	# Set the port used by Elasticsearch at the above address.
	sed -i -e"s|es_port: [0-9]*|es_port: ${ELASTICSEARCH_PORT}|g" ${ELASTALERT_CONFIG} && \

	# Elastalert Supervisor configuration:
	# Redirect Supervisor log output to a file in the designated logs directory.
	sed -i -e"s|logfile=.*log|logfile=${LOG_DIR}/elastalert_supervisord.log|g" ${ELASTALERT_SUPERVISOR_CONF} && \
	# Redirect Supervisor stderr output to a file in the designated logs directory.
	sed -i -e"s|stderr_logfile=.*log|stderr_logfile=${LOG_DIR}/elastalert_stderr.log|g" ${ELASTALERT_SUPERVISOR_CONF} && \
	# Modify the start-command.
	sed -i -e"s|python elastalert.py|python -m elastalert.elastalert --config ${ELASTALERT_CONFIG}|g" ${ELASTALERT_SUPERVISOR_CONF} && \
	
	# Copy the Elastalert configuration file to Elastalert home directory to be used when creating index first time an Elastalert container is launched.
	cp ${ELASTALERT_CONFIG} ${ELASTALERT_HOME}/config.yaml && \
	
	# Add Elastalert to Supervisord.
	supervisord -c ${ELASTALERT_SUPERVISOR_CONF}

# Define mount points.
VOLUME [ "${CONFIG_DIR}", "${RULES_DIRECTORY}", "${LOG_DIR}"]
# Launch Elastalert when a container is started.
CMD ["/opt/start-elastalert.sh"]

#ENTRYPOINT python -m elastalert.elastalert --verbose --rule example_frequency.yaml
