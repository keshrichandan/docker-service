# Stage 1: Build the JAR file
FROM maven:3.3.2-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn clean package

# Stage 2: Create the Docker image
FROM openjdk:17

COPY --from=build /app/target/*.jar dockerservice.jar

ENTRYPOINT ["java", "-jar", "/dockerservice.jar"]

EXPOSE 8080