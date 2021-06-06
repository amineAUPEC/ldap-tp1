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
vi Sherismith.ldif

ldapmodify -w vitrygtr -D "cn=admin,dc=example,dc=com" -x -H ldap://localhost -f Sherismith.ldif
# ldapmodify -w vitrygtr -D "cn=admin,dc=example,dc=com" -x -H ldap://localhost -f sherismith.ldif


# question 2.1 : page 8
# ldapmodify -w vitrygtr -D "cn=admin,dc=example,dc=com" -x -H ldap://localhost -f sherismith.ldif
ldapmodrdn -w vitrygtr -D "cn=admin,dc=example,dc=com" -x -H ldap://localhost -f ldapmodrdn.ldif

# question 3.1 : page 8

# ldapdelete -w vitrygtr -D "cn=admin,dc=example,dc=com" -x -H ldap://localhost -f ldapdelete.ldif
# ldapdelete -w vitrygtr -D "cn=admin,dc=example,dc=com" -H ldap://localhost -f ldapdelete.ldif

ldapadd -w vitrygtr -D "cn=admin,dc=example,dc=com" -x -H ldap://localhost -f ldapdelete.ldif





echo "----------------------------------------------------------------------------------------------------------------------"
echo "partie1.2 : LDAP Complément : "


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

dpkg-reconfigure slapd <<< "ENTREPRISE ACME", "ACME.ORG", "com", "mdb", 



# opération 2 :
ldapsearch -D "cn=admin,...,dc=ACME,dc=CORP" -w vitrygtr -p 389 -h localhost -b "dc=ACME,dc=CORP" -s su "(objectclass=*)"
ldapsearch -D "cn=admin,dc=ACME,dc=CORP" -w vitrygtr -p 389 -h localhost -b "dc=ACME,dc=CORP" -s su "(objectclass=*)"


# requête simplifiée
ldapsearch -h localhost "(objectclass=*)"


# interface GUI

#nom des attributs :


ldapsearch -h localhost "(objectclass=*)" <<< "<<password>>"


ldapsearch -x -h localhost -b "dc=acme,dc=org" "(objectclass=*)" objectclass cn

# cn et ses autres attributs :

ldapsearch -h localhost "(objectclass=*)" mail cn sn givenname  <<< "<<password>>"

# spécification d'un niveau de recherche :

ldapsearch -s onelevel -h localhost "(objectclass=*)" <<< "<<password>>"

#  recherche avec filtre :


ldapsearch -D "cn=admin,...,dc=ACME,dc=CORP" -w vitrygtr -p 389 -h localhost -b "dc=ACME,dc=CORP" -s sub "cn=etudiant1234"
ldapsearch -D "cn=admin,dc=ACME,dc=CORP" -w vitrygtr -p 389 -h localhost -b "dc=ACME,dc=CORP" -s sub "cn=etudiant1234"
#  q2 :
ldapsearch -x -h localhost -b "dc=ACME, dc=ORG" "(objectclass=*)" objectclass cn

# q3 :

ldapsearch -s onelevel -h localhost -b "dc=ACME,dc=ORG" "(objectclass=*)" ou objectclass ccn


# q5 :
ldapsearch -s sub -x -h localhost -b "dc=ACME,dc=ORG" "cn=Units"

ldapsearch -s sub -x -h localhost -b "dc=ACME,dc=ORG" "cn=Persons"

ldapsearch -b "dc=ACME,dc=ORG" "ou=Persons" -w vitrygtr -p 389 -h localhost "dc=ACME,dc=CORP" 


nano Persons.ldif
ldapsearch -x -h localhost -b "dc=ACME,dc=ORG" -f Persons.ldif sn givenname


# q8 :
ldapsearch -x -h localhost -b "dc=ACME,dc=ORG" "(mail=*)" 

ldapsearch -x -h localhost -b "dc=ACME,dc=ORG" "(mail=*@*)" 
ldapsearch -x -h localhost -b "dc=ACME,dc=ORG" "(sn=Nouveau)" 
ldapsearch -x -h localhost -b "dc=ACME,dc=ORG" "(sn=G)" 
ldapsearch -x -h localhost -b "dc=ACME,dc=ORG" "(cn=*u*a*)" 
ldapsearch -x -h localhost -b "dc=ACME,dc=ORG" "(telephonenumber=*555)" 
ldapsearch -x -h localhost -b "dc=ACME,dc=ORG" "(objectclass=persons)" 

# q9 :
ldapsearch -x -h localhost -b "dc=ACME,dc=ORG" "(mail=*@*)" 
ldapsearch -x -h localhost -b "dc=ACME,dc=ORG" "(sn=Nouveau)" 
ldapsearch -x -h localhost -b "dc=ACME,dc=ORG" "(sn=G)" 
ldapsearch -x -h localhost -b "dc=ACME,dc=ORG" "(cn=*u*a*)" 
ldapsearch -x -h localhost -b "dc=ACME,dc=ORG" "(telephonenumber=*555)" 
ldapsearch -x -h localhost -b "dc=ACME,dc=ORG" "(objectclass=persons)" 

# q10 :

ldapsearch -x -h localhost -b "dc=ACME,dc=ORG" "(homedir=/home/etudiant)" 
ldapsearch -x -h localhost -b "dc=ACME,dc=ORG" "(description=*\28*\29)" 
ldapsearch -x -h localhost -b "dc=ACME,dc=ORG" "(group=\5b\04)" 


# q11 :

ldapsearch -x -h localhost -b "dc=ACME,dc=ORG" "I=Groupe_Admin, dc=ACME,dc=ORG" "(objectclass=*)"


# q12 :
ldapsearch -x -h localhost -b "dc=ACME,dc=ORG" -b "cn=schema" -s base "objectclass=*"
# q13 :
ldapsearch -D "cn=admin,dc=ACME,dc=CORP" -w vitrygtr -p 389 -x -h localhost -b "cn=schema" -s sub "(objectclass=*)" creatorsName createTimestamp modifiersName modifyTimestamp
# q14 :
ldapsearch -D "cn=admin,dc=ACME,dc=CORP"  -w vitrygtr -p 389 -h localhost -x -s base -b "" +
# q15 :

ldapsearch -D "cn=admin,dc=ACME,dc=CORP"  -w vitrygtr -p 389 -x -h localhost -s base -b "" +

# q16 :

ldapsearch -D "cn=admin,dc=ACME,dc=CORP"  -w vitrygtr -p 389 -x -h localhost -s base -b "" "cn=subschema" "(objectclass=*)"

# q17 :


ldapsearch -D "cn=admin,dc=ACME,dc=CORP"  -w vitrygtr -p 389 -x -h localhost -s base -b "" "cn=subschema" "(objectclass=account)"




#-----------------------------------------
#TP1 PARTIE 1

# notes : chibani commands


# sudo netstat -an | grep LISTEN
# netstat -s
# sudo find   /  -name netstat
# net-tools