FROM tomcat:9.0.0.M18-jre8-alpine
RUN adduser -D tomcat; chown -R tomcat:tomcat /usr/local/tomcat
USER tomcat
COPY target/sparkjava-hello-world-1.0.war /usr/local/tomcat/webapps
