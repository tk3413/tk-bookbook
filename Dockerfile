FROM clojure:temurin-17-lein-alpine

# Install OpenJDK 11
RUN apk add --no-cache openjdk11

ENV JAVA_HOME /usr/lib/jvm/default-jvm
ENV PATH="${JAVA_HOME}/bin:${PATH}"

# Set the working directory to /app
WORKDIR /app

# Copy the project.clj and src directories into the container
COPY project.clj .
COPY src/ ./src

# Run lein deps to download dependencies
RUN lein deps

# Build a jar
RUN lein uberjar

EXPOSE 8083

# Start the application by running the uberjar
CMD ["java", "-jar", "/app/target/uberjar/tk-clojure-0.1.0-SNAPSHOT-standalone.jar"]