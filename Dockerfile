FROM tomcat:9-jdk11-openjdk

# Clean default webapps
RUN rm -rf /usr/local/tomcat/webapps/*

# Copy WAR to webapps
COPY BankWebBuild/BankWebBuild/BankWebBuild/BankWeb.war /usr/local/tomcat/webapps/ROOT.war

# Expose port
EXPOSE 8070

CMD ["catalina.sh", "run"]
