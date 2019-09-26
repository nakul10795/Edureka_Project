FROM tomcat
ADD target/addressbook.war /usr/local/tomcat/webapps
EXPOSE 9090
CMD /usr/local/tomcat/bin/catalina.sh run
