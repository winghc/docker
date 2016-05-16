docker run --detach --name openldap \
	--env LDAP_ORGANISATION="bigdata lab" --env LDAP_DOMAIN="bigdata.lab" \
	--env LDAP_ADMIN_PASSWORD="admin" \
	--publish 389:389 --publish 636:636 \
	osixia/openldap:1.1.2
