# Use base image
FROM openjdk:23-jdk-slim

# Set working directory
WORKDIR /app

# Copy source files
COPY src/main/java/*.java ./src/
COPY lib ./lib/

# Create output directory
RUN mkdir out

# Compile Java files and create JAR
RUN javac -cp "lib/*" -d out src/*.java && \
    echo "Main-Class: SignupServlet" > manifest.txt && \
    jar cfm BankWeb.jar manifest.txt -C out .

# Expose port
EXPOSE 8080

# Run the application
ENTRYPOINT ["java", "-cp", "BankWeb.jar:lib/*", "SignupServlet"]
