# Start with a base image containing Java runtime
FROM openjdk:8-jdk-alpine

#
RUN apk add --no-cache curl bash vim htop

# Add a volume pointing to /tmp
VOLUME /tmp

# Make port 8080 available to the world outside this container
EXPOSE 8080

# Add the application's jar to the container
COPY /target/app.jar app.jar

# Run the jar file
ENTRYPOINT ["java","-Djava.security.egd=file:/dev/./urandom","-jar","/app.jar"]