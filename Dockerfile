FROM tomcat:9.0

# Replace default server.xml if needed
COPY tomcat/conf/server.xml /usr/local/tomcat/conf/server.xml

# Deploy your WAR as ROOT
COPY BankWebBuild/BankWebBuild/BankWebBuild/BankWeb.war /usr/local/tomcat/webapps/ROOT.war
