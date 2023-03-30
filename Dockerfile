# Use a base image with Java and Tomcat pre-installed
FROM tomcat:9-jdk11-openjdk-slim

# Set the working directory to the Tomcat webapps directory
WORKDIR /usr/local/tomcat/webapps/

# Copy the Spring MVC web application WAR file to the webapps directory
COPY target/java/com/jsp /usr/local/tomcat/webapps/

# Expose port 8080 for Tomcat
EXPOSE 8080

# Start Tomcat when the container is started
CMD ["catalina.sh", "run"]
