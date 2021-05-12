su
apt-get update -y
apt-get install slapd ldap-utils -y


/etc/init.d/slapd restart
# /etc/init.d/sldap restart


ps -aux | grep ldap


netstat -autp | grep ldap


apt-get install -y less

slapcat 
slapcat | less

dpkg-reconfigure slapd <<< "EXAMPLE", "com", "mdb", 
# dpkg-reconfigure slapd <<< "esiee", "fr", "mdb", 


ldapsearch
man ldapsearch


## opération 1: page 3 : 

# ldapadd -w vitrygtr -D "cn=admin,dc=esiee,dc=fr" -x -H  ldap://localhost -f Organizations.ldif
ldapadd -w vitrygtr -D "cn=admin,dc=example,dc=com" -x -H  ldap://localhost -f Organizations.ldif
# ldapadd -w secret -D "cn=admin,dc=esiee,dc=fr" -x -H  ldap://localhost -f Organizations.ldif

## opération 2: page 4 : 
ldapadd -w vitrygtr -D "cn=admin,dc=example,dc=com" -x -H  ldap://localhost -f Persons.ldif


## Opération 3 : page 6
ldapadd -w vitrygtr -D "cn=admin,dc=example,dc=com" -x -H  ldap://localhost -f pure.ldif



## Opération 4 : page 6
ldapadd -w vitrygtr  -x -D "cn=admin, dc=example,dc=com " -w vitrygtr -f Addgroup.ldif
ldapadd -w vitrygtr  -x -D "cn=admin, dc=example,dc=com " -w vitrygtr -f Adduser.ldif

## Opération 4.2 : page 6

ldapsearch -x -H ldap://localhost -b "ou=employees, ou=people,dc=example,dc=com" "(objectclass=*)"

## Opération 1 : page 7

# vi sherismith.ldif
vi sherismith.ldif
# vi Sherismith.ldif555

ldapmodify -w vitrygtr -D "cn=admin,dc=example,dc=com" -x -H ldap://localhost -f Sherismith.ldif
# ldapmodify -w vitrygtr -D "cn=admin,dc=example,dc=com" -x -H ldap://localhost -f sherismith.ldif


# question 2.1 : page 8
# ldapmodify -w vitrygtr -D "cn=admin,dc=example,dc=com" -x -H ldap://localhost -f sherismith.ldif
ldapmodrdn -w vitrygtr -D "cn=admin,dc=example,dc=com" -x -H ldap://localhost -f ldapmodrdn.ldif

# question 3.1 : page 8

# ldapdelete -w vitrygtr -D "cn=admin,dc=example,dc=com" -x -H ldap://localhost -f ldapdelete.ldif
# ldapdelete -w vitrygtr -D "cn=admin,dc=example,dc=com" -H ldap://localhost -f ldapdelete.ldif

ldapadd -w vitrygtr -D "cn=admin,dc=example,dc=com" -x -H ldap://localhost -f ldapdelete.ldif













# notes : chibani commands


# sudo netstat -an | grep LISTEN
# netstat -s
# sudo find   /  -name netstat
# net-tools