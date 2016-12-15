docker run --hostname ldap.ccc.com \
	--publish 389:389 --publish 636:636 \
	--env LDAP_ORGANISATION="ccc" \
	--env LDAP_DOMAIN="lab.ccc.com" \
	--env LDAP_ADMIN_PASSWORD="admin-password" \
	--volume /opt/dockerdata/slapd/database:/var/lib/ldap  \
	--volume /opt/dockerdata/slapd/config:/etc/ldap/slapd.d \
	--name ldap \
	--detach osixia/openldap:1.1.7

#verify
#ldapsearch -x -h localhost -b "cn=lab,dc=ccc,dc=com"

