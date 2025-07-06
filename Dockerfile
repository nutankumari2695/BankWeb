FROM tomcat:9.0

COPY tomcat/conf/server.xml /usr/local/tomcat/conf/server.xml
COPY BankWebBuild/BankWebBuild/BankWebBuild/BankWeb.war /usr/local/tomcat/webapps/ROOT.war

EXPOSE 8080
CMD ["catalina.sh", "run"]

