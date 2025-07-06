# Use OpenJDK 24 image
FROM openjdk:23-jdk-slim

# Add a label
# LABEL maintainer="yourname@example.com"

# Create app directory inside container
WORKDIR /app

# Copy the compiled jar file into the container (adjust the filename as needed)
COPY BankWeb.jar app.jar

# Expose port (adjust if needed)
EXPOSE 8070

# Run the app
ENTRYPOINT ["java", "-jar", "app.jar"]
