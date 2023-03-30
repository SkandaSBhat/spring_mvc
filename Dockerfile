# Use a base image with Java and Maven pre-installed
FROM maven:3.6.3-openjdk-11-slim

# Set the working directory to /app
WORKDIR /app

# Copy the pom.xml file to the container
COPY pom.xml .

# Download and install the project dependencies
RUN mvn dependency:go-offline

# Copy the source code to the container
COPY src/ ./src/

# Build the project
RUN mvn package

# Use a base image with Java and Tomcat pre-installed
FROM tomcat:9-jdk11-openjdk-slim

# Set the working directory to the Tomcat webapps directory
WORKDIR /usr/local/tomcat/webapps/

# Copy the Spring MVC web application WAR file to the webapps directory
COPY --from=0 /app/target/my-spring-mvc-app.war .

# Expose port 8080 for Tomcat
EXPOSE 8080

# Start Tomcat when the container is started
CMD ["catalina.sh", "run"]
