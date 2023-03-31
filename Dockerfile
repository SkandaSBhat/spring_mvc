# Use a base image with Java and Maven pre-installed
FROM maven:3-eclipse-temurin-11

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


