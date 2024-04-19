# Use Alpine Linux as base image
FROM alpine:latest

# Set the maintainer information
LABEL maintainer="jmd@LearningSystems.ai"

# Install necessary packages
RUN apk update && \
    apk add --no-cache openjdk17 maven git openssh-client && \
    rm -rf /var/cache/apk/*

# Set the environment variables
ENV JAVA_HOME=/usr/lib/jvm/default-jvm \
    PATH=${PATH}:/usr/lib/jvm/default-jvm/bin \
    MAVEN_HOME=/usr/share/maven

# Set the working directory
WORKDIR /app

# Display the Java and Maven version information on container startup
CMD ["sh", "-c", "java -version && mvn -version"]
